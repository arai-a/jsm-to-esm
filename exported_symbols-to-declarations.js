/* global module */

module.exports = function(fileInfo, api) {
  const { jscodeshift } = api;
  const root = jscodeshift(fileInfo.source);
  doTranslate(jscodeshift, root);
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

function collectAndRemoveExportedSymbols(root) {
  const nodes = root.findVariableDeclarators("EXPORTED_SYMBOLS");
  if (!nodes.length) {
    throw Error(`EXPORTED_SYMBOLS not found`);
  }

  let path = nodes.get(0);
  const obj = nodes.get(0).node.init;
  if (!obj) {
    throw Error(`EXPORTED_SYMBOLS is not statically known`);
  }

  if (path.parent.node.declarations.length !== 1) {
    throw Error(`EXPORTED_SYMBOLS shouldn't be declarated with other variables`);
  }

  path.parent.prune();

  const EXPORTED_SYMBOLS = new Set();
  if (obj.type !== "ArrayExpression") {
    throw Error(`EXPORTED_SYMBOLS is not statically known`);
  }

  for (const elem of obj.elements) {
    if (elem.type !== "Literal") {
      throw Error(`EXPORTED_SYMBOLS is not statically known`);
    }
    var name = elem.value;
    if (typeof name !== "string") {
      throw Error(`EXPORTED_SYMBOLS is not statically known`);
    }
    EXPORTED_SYMBOLS.add(name);
  }

  return EXPORTED_SYMBOLS;
}

function isTopLevel(path) {
  return path.parent.node.type === "Program";
}

function convertToExport(jscodeshift, path, name) {
  const e = jscodeshift.exportNamedDeclaration(path.node);
  e.comments = [];
  e.comments = path.node.comments;
  path.node.comments = [];

  path.replace(e);
}

function doTranslate(jscodeshift, root) {
  const EXPORTED_SYMBOLS = collectAndRemoveExportedSymbols(root);

  root.find(jscodeshift.FunctionDeclaration).forEach(path => {
    if (!isTopLevel(path)) {
      return;
    }
    const name = path.node.id.name;
    if (!EXPORTED_SYMBOLS.has(name)) {
      return;
    }
    EXPORTED_SYMBOLS.delete(name);
    convertToExport(jscodeshift, path, name);
  });


  root.find(jscodeshift.ClassDeclaration).forEach(path => {
    if (!isTopLevel(path)) {
      return;
    }
    const name = path.node.id.name;
    if (!EXPORTED_SYMBOLS.has(name)) {
      return;
    }
    EXPORTED_SYMBOLS.delete(name);
    convertToExport(jscodeshift, path, name);
  });

  root.find(jscodeshift.VariableDeclaration).forEach(path => {
    if (!isTopLevel(path)) {
      return;
    }

    let exists = false;
    let name;
    for (const decl of path.node.declarations) {
      if (decl.id.type === "Identifier") {
        name = decl.id.name;
        if (EXPORTED_SYMBOLS.has(name)) {
          exists = true;
          break;
        }
      }

      if (decl.id.type === "ObjectPattern") {
        if (decl.id.properties.length === 1) {
          const prop = decl.id.properties[0];
          if (prop.shorthand) {
            if (prop.key.type === "Identifier") {
              name = prop.key.name;
              if (EXPORTED_SYMBOLS.has(name)) {
                exists = true;
                break;
              }
            }
          }
        }
      }
    }
    if (!exists) {
      return;
    }

    if (path.node.declarations.length !== 1) {
      throw Error(`exported variable shouldn't be declarated with other variables`);
    }

    EXPORTED_SYMBOLS.delete(name);
    convertToExport(jscodeshift, path, name);
  });

  if (EXPORTED_SYMBOLS.size !== 0) {
    throw Error(`exported symbols ${[...EXPORTED_SYMBOLS].join(",")} not found`);
  }
}
