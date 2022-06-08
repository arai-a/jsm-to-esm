/* global module */

module.exports = function(fileInfo, api) {
  const { jscodeshift } = api;
  const root = jscodeshift(fileInfo.source);
  doTranslate(jscodeshift, root);
  return root.toSource();
};

module.exports.doTranslate = doTranslate;

function calleeToString(node) {
  if (node.type === "Identifier") {
    return node.name;
  }

  if (node.type === "MemberExpression" && !node.computed) {
    return calleeToString(node.object) + "." + node.property.name;
  }

  return "???";
}

function isImportESMCall(node) {
  return calleeToString(node.callee) === "ChromeUtils.importESM";
}

function isString(node) {
  return node.type === "Literal" && typeof node.value === "string";
}

function doTranslate(jscodeshift, root) {
  root.find(jscodeshift.CallExpression).forEach(path => {
    if (path.parent.node.type !== "VariableDeclarator") {
      return;
    }

    if (path.parent.parent.node.type !== "VariableDeclaration") {
      return;
    }

    const decls = path.parent.parent.node;
    if (decls.declarations.length !== 1) {
      return;
    }

    if (path.parent.parent.parent.node.type !== "Program") {
      return;
    }

    if (!isImportESMCall(path.node)) {
      return;
    }

    if (path.node.arguments.length !== 1) {
      return;
    }

    const resourceURINode = path.node.arguments[0];
    if (!isString(resourceURINode)) {
      return;
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
          return;
        }
      }
    } else {
      return;
    }

    const e = jscodeshift.importDeclaration(specs, resourceURINode);
    e.comments = path.parent.parent.node.comments;
    path.parent.parent.node.comments = [];
    path.parent.parent.replace(e);
  });
}
