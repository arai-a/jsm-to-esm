let JSPROCESSACTORS = {
  // Miscellaneous stuff that needs to be initialized per process.
  BrowserProcess: {
    child: {
      esModuleURI: "resource:///actors/BrowserProcessChild.sys.mjs",
      observers: [
        // WebRTC related notifications. They are here to avoid loading WebRTC
        // components when not needed.
        "getUserMedia:request",
        "recording-device-stopped",
        "PeerConnection:request",
        "recording-device-events",
        "recording-window-ended",
      ],
    },
  },

  outProtections: {
    parent: {
      esModuleURI: "resource:///actors/AboutProtectionsParent.sys.mjs",
    },
    child: {
      esModuleURI: "resource:///actors/AboutProtectionsChild.sys.mjs",

      events: {
        DOMDocElementInserted: { capture: true },
      },
    },

    matches: ["about:protections", "about:protections?*"],
  },

  Prompt: {
    parent: {
      esModuleURI: "resource:///actors/PromptParent.sys.mjs",
    },
    includeChrome: true,
    allFrames: true,
  },
};
