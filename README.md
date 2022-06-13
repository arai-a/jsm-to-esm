# Convert JSM to ESM

Rules and scripts to convert mozilla-unified in-tree JSM files to ESM.

## Preparation

```
$ cd jsm-to-esm
$ npm install jscodeshift
```

## Rename `*.jsm` to `*.sys.mjs`, including the references in build files

Rename `*.jsm` or `*.js` file to `*.sys.mjs` file, at the same time rewriting references
or the file in build files in the file's and ancestor directories.

If no reference is found, this script doesn't rename the file.

 * `moz.build`
 * `jar.mn`
 * `browser.ini`
 * `browser-common.ini`
 * `chrome.ini`
 * `mochitest.ini`
 * `xpcshell.ini`
 * `xpcshell-child-process.ini`
 * `xpcshell-common.ini`
 * `xpcshell-parent-process.ini`
 * `components.conf` (including replacing property name "jsm" to "esm")

NOTE: This does not guarantee all references in build files are rewritten.
Especially if the file is referred from other subdirectory.

```
$ cd path/to/mozilla-unified
$ python3 path/to/jsm-to-esm/rename.py relative/path/to/file.jsm
```

## Convert `EXPORTED_SYMBOLS` to `export` declaration

Remove `EXPORTED_SYMBOLS` definition in `path/to/file.sys.mjs` file, and convert
each exported symbol into `export` declaration.

```
$ cd path/to/mozilla-unified
$ path/to/jsm-to-esm/node_modules/.bin/jscodeshift \
    -t path/to/jsm-to-esm/exported_symbols-to-declarations.js \
    path/to/file.sys.mjs
$ ./mach eslint --fix path/to/file.sys.mjs
```

## Convert `ChromeUtils.import` to `ChromeUtils.importESM`

For each `ChromeUtils.import` or related APIs, convert it to ESM-variant if
the imported module is already ESM-ified.

This script checks if the file is ESM-ified, and the map between the URI and
the path is defined in `is-esmified.js`.

`ChromeUtils.import` at the top-level is converted to static import declaration.

```
$ cd path/to/mozilla-unified
$ path/to/jsm-to-esm/node_modules/.bin/jscodeshift \
    -t path/to/jsm-to-esm/import-to-import_esm.js \
    path/to/file.sys.mjs
$ ./mach eslint --fix path/to/file.sys.mjs
```

Supported APIs are the following:

 * `Cu.import`
 * `ChromeUtils.import`
 * `XPCOMUtils.defineLazyModuleGetter`
 * `ChromeUtils.defineModuleGetter`
 * `XPCOMUtils.defineLazyModuleGetters`
 * process/window actor definition objects
