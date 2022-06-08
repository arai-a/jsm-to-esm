const fs = require("fs");
const path = require("path");
const { isESMified } = require(path.resolve(__dirname, "./is-esmified.js"));

/* global module */

module.exports = function(fileInfo, api) {
  const { jscodeshift } = api;
  const root = jscodeshift(fileInfo.source);
  doTranslate(fileInfo.path, jscodeshift, root);
  return root.toSource();
};

module.exports.doTranslate = doTranslate;

function IsIdentifier(node, name) {
  if (node.type !== "Identifier") {
    return false;
  }
  if (node.name !== name) {
    return false;
  }
  return true;
}

function calleeToString(node) {
  if (node.type === "Identifier") {
    return node.name;
  }

  if (node.type === "MemberExpression" && !node.computed) {
    return calleeToString(node.object) + "." + node.property.name;
  }

  return "???";
}

function isImportCall(node) {
  const s = calleeToString(node.callee);
  return [
    "Cu.import",
    "ChromeUtils.import",
  ].includes(s);
}

function isLazyGetterCall(node) {
  const s = calleeToString(node.callee);
  return [
    "XPCOMUtils.defineLazyModuleGetter",
    "ChromeUtils.defineModuleGetter",
  ].includes(s);
}

function isLazyGettersCall(node) {
  const s = calleeToString(node.callee);
  return [
    "XPCOMUtils.defineLazyModuleGetters",
  ].includes(s);
}

function warnForPath(inputFile, path, message) {
  const loc = path.node.loc;
  console.log(`WARNING: ${inputFile}:${loc.start.line}:${loc.start.column} : ${message}`);
}

function esmifiy(s) {
  return s.replace(/\.jsm$/, ".sys.mjs");
}

function isString(node) {
  return node.type === "Literal" && typeof node.value === "string";
}

function doTranslate(inputFile, jscodeshift, root) {
  root.find(jscodeshift.CallExpression).forEach(path => {
    if (isImportCall(path.node)) {
      if (path.node.arguments.length !== 1) {
        warnForPath(inputFile, path, `import call should have only one argument`);
        return;
      }

      const resourceNode = path.node.arguments[0];
      if (!isString(resourceNode)) {
        warnForPath(inputFile, path, `resource URI should be a string`);
        return;
      }

      const resourceURI = resourceNode.value;
      if (!resourceNode.value.endsWith(".jsm")) {
        warnForPath(inputFile, path, `Non-jsm: ${resourceURI}`);
        return;
      }

      if (!isESMified(resourceURI)) {
        return;
      }

      path.node.callee.object.name = "ChromeUtils";
      path.node.callee.property.name = "importESM";
      resourceNode.value = esmifiy(resourceNode.value);
    } else if (isLazyGetterCall(path.node)) {
      if (path.node.arguments.length !== 3) {
        warnForPath(inputFile, path, `lazy getter call should have 3 arguments`);
        return;
      }

      const nameNode = path.node.arguments[1];
      if (!isString(nameNode)) {
        warnForPath(inputFile, path, `name should be a string`);
        return;
      }

      const resourceNode = path.node.arguments[2];
      if (!isString(resourceNode)) {
        warnForPath(inputFile, path, `resource URI should be a string`);
        return;
      }

      const resourceURI = resourceNode.value;
      if (!resourceNode.value.endsWith(".jsm")) {
        warnForPath(inputFile, path, `Non-jsm: ${resourceURI}`);
        return;
      }

      if (!isESMified(resourceURI)) {
        return;
      }

      const name = nameNode.value;

      path.node.callee.object.name = "ChromeUtils";
      path.node.callee.property.name = "defineESMGetters";
      resourceNode.value = esmifiy(resourceNode.value);
      path.node.arguments = [
        path.node.arguments[0],
        jscodeshift.objectExpression([
          jscodeshift.property("init", nameNode, resourceNode),
        ]),
      ];
    } else if (isLazyGettersCall(path.node)) {
      if (path.node.arguments.length !== 2) {
        warnForPath(inputFile, path, `lazy getters call should have 2 arguments`);
        return;
      }

      const modulesNode = path.node.arguments[1];
      if (modulesNode.type !== "ObjectExpression") {
        warnForPath(inputFile, path, `modules parameter should be an object`);
        return;
      }

      const esmProps = [];
      const jsmProps = [];

      for (const prop of modulesNode.properties) {
        const resourceNode = prop.value;
        if (!isString(resourceNode)) {
          warnForPath(inputFile, path, `resource URI should be a string`);
          jsmProps.push(prop);
          continue;
        }

        const resourceURI = resourceNode.value;
        if (!resourceNode.value.endsWith(".jsm")) {
          warnForPath(inputFile, path, `Non-jsm: ${resourceURI}`);
          jsmProps.push(prop);
          continue;
        }

        if (!isESMified(resourceURI)) {
          jsmProps.push(prop);
          continue;
        }

        esmProps.push(prop);
      }

      if (esmProps.length === 0) {
        return;
      }

      if (jsmProps.length === 0) {
        path.node.callee.object.name = "ChromeUtils";
        path.node.callee.property.name = "defineESMGetters";
        for (const prop of esmProps) {
          const resourceNode = prop.value;
          resourceNode.value = esmifiy(resourceNode.value);
        }
      } else {
        if (path.parent.node.type !== "ExpressionStatement") {
          warnForPath(inputFile, path, `lazy getters call in unexpected context`);
          return;
        }

        for (const prop of esmProps) {
          const resourceNode = prop.value;
          resourceNode.value = esmifiy(resourceNode.value);
        }

        const callStmt = jscodeshift.expressionStatement(
          jscodeshift.callExpression(
            jscodeshift.memberExpression(
              jscodeshift.identifier("ChromeUtils"),
              jscodeshift.identifier("defineESMGetters")
            ),
            [
              path.node.arguments[0],
              jscodeshift.objectExpression(esmProps),
            ]
          )
        );

        callStmt.comments = path.parent.node.comments;
        path.parent.node.comments = [];
        path.parent.insertBefore(callStmt);

        path.node.arguments[1].properties = jsmProps;
      }
    }
  });
}
