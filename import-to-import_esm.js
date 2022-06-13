let { isESMified } = require(require("path").resolve(__dirname, "./is-esmified.js"));

/* global module */

module.exports = function(fileInfo, api) {
  // Special mode for testing.
  if (fileInfo.path.startsWith('./tests/output/')) {
    isESMified = () => true;
  }

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

const extPattern = /\.(jsm|js|jsm\.js)$/;

function esmifiy(s) {
  return s.replace(extPattern, ".sys.mjs");
}

function isString(node) {
  return node.type === "Literal" && typeof node.value === "string";
}

function tryReplacingWithStatciImport(jscodeshift, inputFile, path, resourceURINode) {
  if (!inputFile.endsWith(".sys.mjs")) {
    // Static import is available only in system ESM.
    return false;
  }

  if (path.parent.node.type !== "VariableDeclarator") {
    return false;
  }

  if (path.parent.parent.node.type !== "VariableDeclaration") {
    return false;
  }

  const decls = path.parent.parent.node;
  if (decls.declarations.length !== 1) {
    return false;
  }

  if (path.parent.parent.parent.node.type !== "Program") {
    return false;
  }

  if (path.node.arguments.length !== 1) {
    return false;
  }

  const resourceURI = resourceURINode.value;

  const specs = [];

  if (path.parent.node.id.type === "Identifier") {
    specs.push(jscodeshift.importNamespaceSpecifier(path.parent.node.id));
  } else if (path.parent.node.id.type === "ObjectPattern") {
    for (const prop of path.parent.node.id.properties) {
      if (prop.shorthand) {
        specs.push(jscodeshift.importSpecifier(prop.key));
      } else if (prop.value.type === "Identifier") {
        specs.push(jscodeshift.importSpecifier(prop.key, prop.value));
      } else {
        return false;
      }
    }
  } else {
    return false;
  }

  resourceURINode.value = esmifiy(resourceURI);

  const e = jscodeshift.importDeclaration(specs, resourceURINode);
  e.comments = path.parent.parent.node.comments;
  path.parent.parent.node.comments = [];
  path.parent.parent.replace(e);

  return true;
}



function replaceImportCall(inputFile, jscodeshift, path) {
  if (path.node.arguments.length !== 1) {
    warnForPath(inputFile, path, `import call should have only one argument`);
    return;
  }

  const resourceURINode = path.node.arguments[0];
  if (!isString(resourceURINode)) {
    warnForPath(inputFile, path, `resource URI should be a string`);
    return;
  }

  const resourceURI = resourceURINode.value;
  if (!resourceURI.match(extPattern)) {
    warnForPath(inputFile, path, `Non-jsm: ${resourceURI}`);
    return;
  }

  if (!isESMified(resourceURI)) {
    return;
  }

  if (!tryReplacingWithStatciImport(jscodeshift, inputFile, path, resourceURINode)) {
    path.node.callee.object.name = "ChromeUtils";
    path.node.callee.property.name = "importESM";
    resourceURINode.value = esmifiy(resourceURI);
  }
}

function replaceLazyGetterCall(inputFile, jscodeshift, path) {
  if (path.node.arguments.length !== 3) {
    warnForPath(inputFile, path, `lazy getter call should have 3 arguments`);
    return;
  }

  const nameNode = path.node.arguments[1];
  if (!isString(nameNode)) {
    warnForPath(inputFile, path, `name should be a string`);
    return;
  }

  const resourceURINode = path.node.arguments[2];
  if (!isString(resourceURINode)) {
    warnForPath(inputFile, path, `resource URI should be a string`);
    return;
  }

  const resourceURI = resourceURINode.value;
  if (!resourceURI.match(extPattern)) {
    warnForPath(inputFile, path, `Non-js/jsm: ${resourceURI}`);
    return;
  }

  if (!isESMified(resourceURI)) {
    return;
  }

  const name = nameNode.value;

  path.node.callee.object.name = "ChromeUtils";
  path.node.callee.property.name = "defineESMGetters";
  resourceURINode.value = esmifiy(resourceURI);
  path.node.arguments = [
    path.node.arguments[0],
    jscodeshift.objectExpression([
      jscodeshift.property("init", nameNode, resourceURINode),
    ]),
  ];
}

function replaceLazyGettersCall(inputFile, jscodeshift, path) {
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
    const resourceURINode = prop.value;
    if (!isString(resourceURINode)) {
      warnForPath(inputFile, path, `resource URI should be a string`);
      jsmProps.push(prop);
      continue;
    }

    const resourceURI = resourceURINode.value;
    if (!resourceURI.match(extPattern)) {
      warnForPath(inputFile, path, `Non-js/jsm: ${resourceURI}`);
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
      const resourceURINode = prop.value;
      resourceURINode.value = esmifiy(resourceURINode.value);
    }
  } else {
    if (path.parent.node.type !== "ExpressionStatement") {
      warnForPath(inputFile, path, `lazy getters call in unexpected context`);
      return;
    }

    for (const prop of esmProps) {
      const resourceURINode = prop.value;
      resourceURINode.value = esmifiy(resourceURINode.value);
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

function getProp(obj, key) {
  if (obj.type !== "ObjectExpression") {
    return null;
  }

  for (const prop of obj.properties) {
    if (prop.computed) {
      continue;
    }

    if (IsIdentifier(prop.key, key)) {
      return prop;
    }
  }

  return null;
}

function tryReplaceActorDefinition(inputFile, path, name) {
  const obj = path.node;

  const prop = getProp(obj, name);
  if (!prop) {
    return;
  }

  const moduleURIProp = getProp(prop.value, "moduleURI");
  if (!moduleURIProp) {
    return;
  }

  if (!isString(moduleURIProp.value)) {
    warnForPath(inputFile, path, `${name} moduleURI should be a string`);
    return;
  }

  const moduleURI = moduleURIProp.value.value;
  if (!moduleURI.match(extPattern)) {
    warnForPath(inputFile, path, `${name} Non-js/jsm: ${moduleURI}`);
    return;
  }

  if (!isESMified(moduleURI)) {
    return;
  }

  moduleURIProp.key.name = "esmURI";
  moduleURIProp.value.value = esmifiy(moduleURI);
}

function doTranslate(inputFile, jscodeshift, root) {
  root.find(jscodeshift.CallExpression).forEach(path => {
    if (isImportCall(path.node)) {
      replaceImportCall(inputFile, jscodeshift, path);
    } else if (isLazyGetterCall(path.node)) {
      replaceLazyGetterCall(inputFile, jscodeshift, path);
    } else if (isLazyGettersCall(path.node)) {
      replaceLazyGettersCall(inputFile, jscodeshift, path);
    }
  });

  root.find(jscodeshift.ObjectExpression).forEach(path => {
    tryReplaceActorDefinition(inputFile, path, "parent");
    tryReplaceActorDefinition(inputFile, path, "child");
  });
}
