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

`Cu.import` and `ChromeUtils.import` at the top-level of system ESM are
converted to static import declaration.

By default, this script converts reference to all JSMs.
The target can be reduced by modifying `targetFilePrefix` option in `config.js`.

## Expected workflow

 1. Decide which directory to ESM-ify
 2. Clone this repository
 3. Put the directory's path to `targetFilePrefix` field in `config.js`
    * So that import for other files aren't touched by `import-to-import_esm.js`
 4. Run `rename.py` for each JSM in the directory
    * If the script doesn't detect the reference to the file in build files 
      (`moz.build` etc), manually rename the file and fix the references in 
      the build files
    * Also fix any other references to the file. e.g.:
      * ESLint `import-globals-from` rule
      * `importScripts` call if the file is also loaded by worker
      * `Services.scriptloader.loadSubScript` call if the file is also loaded 
        as a sub script
      * Documentation
 5. Apply `exported_symbols-to-declarations.js` for each ESM-ified file in the 
    directory, to convert `EXPORTED_SYMBOLS` to `export` declaration
 6. Apply `import-to-import_esm.js` for each files in the directory that 
    imports the ESM-ified files, to convert any import and lazy getters for
    the modules
 7. Apply `./mach eslint --fix` for all files
 8. Commit
