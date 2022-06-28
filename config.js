/* global module */

module.exports = {
  import_rewrite: {
    // Prefix-match for the imported file's real path in .sys.mjs extension,
    // to restrict the target of the rewrite only to the matching imports.
    // e.g.
    //   * "toolkit/modules/Services.sys.mjs"
    //   * "toolkit/modules/"
    targetFilePrefix: "",
  }
};
