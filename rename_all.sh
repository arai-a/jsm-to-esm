# A test script for batch conversion.

# These files are not yet ready for ESM-ification.
#
# browser/components/customizableui/CustomizableUI.jsm
# browser/components/customizableui/CustomizableWidgets.jsm
# browser/components/customizableui/CustomizeMode.jsm
# browser/components/customizableui/DragPositionManager.jsm
# browser/components/customizableui/PanelMultiView.jsm
# browser/components/customizableui/SearchWidgetTracker.jsm
# browser/components/customizableui/test/CustomizableUITestUtils.jsm
# browser/components/urlbar/UrlbarController.jsm
# browser/components/urlbar/UrlbarEventBufferer.jsm
# browser/components/urlbar/UrlbarInput.jsm
# browser/components/urlbar/UrlbarMuxerUnifiedComplete.jsm
# browser/components/urlbar/UrlbarProviderAboutPages.jsm
# browser/components/urlbar/UrlbarProviderAliasEngines.jsm
# browser/components/urlbar/UrlbarProviderAutofill.jsm
# browser/components/urlbar/UrlbarProviderBookmarkKeywords.jsm
# browser/components/urlbar/UrlbarProviderCalculator.jsm
# browser/components/urlbar/UrlbarProviderExtension.jsm
# browser/components/urlbar/UrlbarProviderHeuristicFallback.jsm
# browser/components/urlbar/UrlbarProviderInputHistory.jsm
# browser/components/urlbar/UrlbarProviderInterventions.jsm
# browser/components/urlbar/UrlbarProviderOmnibox.jsm
# browser/components/urlbar/UrlbarProviderOpenTabs.jsm
# browser/components/urlbar/UrlbarProviderPlaces.jsm
# browser/components/urlbar/UrlbarProviderPreloadedSites.jsm
# browser/components/urlbar/UrlbarProviderPrivateSearch.jsm
# browser/components/urlbar/UrlbarProviderQuickSuggest.jsm
# browser/components/urlbar/UrlbarProviderRemoteTabs.jsm
# browser/components/urlbar/UrlbarProviderSearchSuggestions.jsm
# browser/components/urlbar/UrlbarProviderSearchTips.jsm
# browser/components/urlbar/UrlbarProviderTabToSearch.jsm
# browser/components/urlbar/UrlbarProviderTokenAliasEngines.jsm
# browser/components/urlbar/UrlbarProviderTopSites.jsm
# browser/components/urlbar/UrlbarProviderUnitConversion.jsm
# browser/components/urlbar/UrlbarProvidersManager.jsm
# browser/components/urlbar/UrlbarQuickSuggest.jsm
# browser/components/urlbar/UrlbarResult.jsm
# browser/components/urlbar/UrlbarSearchOneOffs.jsm
# browser/components/urlbar/UrlbarSearchUtils.jsm
# browser/components/urlbar/UrlbarTokenizer.jsm
# browser/components/urlbar/UrlbarUtils.jsm
# browser/components/urlbar/UrlbarValueFormatter.jsm
# browser/components/urlbar/UrlbarView.jsm
# browser/components/urlbar/tests/UrlbarTestUtils.jsm
# browser/components/urlbar/tests/quicksuggest/QuickSuggestTestUtils.jsm
# browser/components/urlbar/unitconverters/UnitConverterSimple.jsm
# browser/components/urlbar/unitconverters/UnitConverterTemperature.jsm
# browser/components/urlbar/unitconverters/UnitConverterTimezone.jsm
# browser/extensions/report-site-issue/experimentalAPIs/actors/tabExtrasActor.jsm
# devtools/shared/loader/worker-loader.js
# devtools/shared/worker/worker.js
# mobile/android/modules/geckoview/AndroidLog.jsm
# remote/marionette/action.js
# services/fxaccounts/FxAccountsCommon.js
# services/sync/modules/constants.js
# toolkit/components/lz4/lz4.js
# toolkit/components/lz4/lz4_internal.js
# toolkit/components/nimbus/ExperimentAPI.jsm
# toolkit/components/nimbus/lib/ExperimentManager.jsm
# toolkit/components/nimbus/lib/ExperimentStore.jsm
# toolkit/components/nimbus/lib/RemoteSettingsExperimentLoader.jsm
# toolkit/components/nimbus/lib/SharedDataMap.jsm
# toolkit/components/nimbus/test/NimbusTestUtils.jsm
# toolkit/components/osfile/modules/osfile_shared_allthreads.jsm
# toolkit/components/osfile/modules/osfile_unix_allthreads.jsm
# toolkit/components/osfile/modules/osfile_win_allthreads.jsm
# toolkit/components/osfile/modules/ospath.jsm
# toolkit/components/osfile/modules/ospath_unix.jsm
# toolkit/components/osfile/modules/ospath_win.jsm
# toolkit/components/osfile/osfile.jsm
# @@

# These files needs special handling.
#
# browser/components/enterprisepolicies/schemas/schema.jsm
# browser/components/newtab/vendor/Redux.jsm
# browser/components/urlbar/UrlbarPrefs.jsm
# devtools/client/performance-new/popup/background.jsm.js
# devtools/client/performance-new/popup/menu-button.jsm.js
# devtools/client/performance-new/popup/panel.jsm.js
# devtools/client/performance-new/symbolication.jsm.js
# devtools/client/performance-new/typescript-lazy-load.jsm.js
# devtools/shared/loader/Loader.jsm
# devtools/shared/loader/base-loader.js
# devtools/shared/loader/browser-loader.js
# dom/media/webvtt/update-webvtt.js
# dom/media/webvtt/vtt.jsm
# dom/push/PushService.jsm
# editor/AsyncSpellCheckTestHelper.jsm
# intl/l10n/FluentSyntax.jsm
# js/xpconnect/tests/unit/bogus_element_type.jsm
# js/xpconnect/tests/unit/bogus_exports_type.jsm
# js/xpconnect/tests/unit/importer.jsm
# js/xpconnect/tests/unit/syntax_error.jsm
# netwerk/test/httpserver/httpd.js
# python/mozbuild/mozbuild/test/backend/data/build/bar.jsm
# python/mozbuild/mozbuild/test/backend/data/build/baz.jsm
# python/mozbuild/mozbuild/test/backend/data/build/foo.jsm
# python/mozbuild/mozbuild/test/backend/data/build/qux.jsm
# remote/cdp/CDP.jsm
# remote/cdp/CDPConnection.jsm
# remote/cdp/Error.jsm
# remote/cdp/JSONHandler.jsm
# remote/cdp/Protocol.jsm
# remote/cdp/StreamRegistry.jsm
# remote/cdp/domains/ContentProcessDomain.jsm
# remote/cdp/domains/ContentProcessDomains.jsm
# remote/cdp/domains/Domain.jsm
# remote/cdp/domains/DomainCache.jsm
# remote/cdp/domains/ParentProcessDomains.jsm
# remote/cdp/domains/content/DOM.jsm
# remote/cdp/domains/content/Emulation.jsm
# remote/cdp/domains/content/Input.jsm
# remote/cdp/domains/content/Log.jsm
# remote/cdp/domains/content/Network.jsm
# remote/cdp/domains/content/Page.jsm
# remote/cdp/domains/content/Performance.jsm
# remote/cdp/domains/content/Runtime.jsm
# remote/cdp/domains/content/Security.jsm
# remote/cdp/domains/content/runtime/ExecutionContext.jsm
# remote/cdp/domains/parent/Browser.jsm
# remote/cdp/domains/parent/Emulation.jsm
# remote/cdp/domains/parent/Fetch.jsm
# remote/cdp/domains/parent/IO.jsm
# remote/cdp/domains/parent/Input.jsm
# remote/cdp/domains/parent/Network.jsm
# remote/cdp/domains/parent/Page.jsm
# remote/cdp/domains/parent/Security.jsm
# remote/cdp/domains/parent/Target.jsm
# remote/cdp/domains/parent/page/DialogHandler.jsm
# remote/cdp/observers/ChannelEventSink.jsm
# remote/cdp/observers/ContextObserver.jsm
# remote/cdp/observers/NetworkObserver.jsm
# remote/cdp/observers/TargetObserver.jsm
# remote/cdp/sessions/ContentProcessSession.jsm
# remote/cdp/sessions/MainProcessSession.jsm
# remote/cdp/sessions/Session.jsm
# remote/cdp/sessions/TabSession.jsm
# remote/cdp/targets/MainProcessTarget.jsm
# remote/cdp/targets/TabTarget.jsm
# remote/cdp/targets/Target.jsm
# remote/cdp/targets/TargetList.jsm
# remote/marionette/atom.js
# remote/shared/messagehandler/Errors.jsm
# remote/shared/messagehandler/test/browser/resources/modules/root/invalid.jsm
# remote/shared/webdriver/Assert.jsm
# remote/shared/webdriver/Capabilities.jsm
# remote/shared/webdriver/Errors.jsm
# remote/shared/webdriver/KeyData.jsm
# remote/shared/webdriver/Session.jsm
# remote/webdriver-bidi/NewSessionHandler.jsm
# remote/webdriver-bidi/RemoteValue.jsm
# remote/webdriver-bidi/WebDriverBiDi.jsm
# remote/webdriver-bidi/WebDriverBiDiConnection.jsm
# remote/webdriver-bidi/modules/ModuleRegistry.jsm
# remote/webdriver-bidi/modules/root/browsingContext.jsm
# remote/webdriver-bidi/modules/root/log.jsm
# remote/webdriver-bidi/modules/root/session.jsm
# remote/webdriver-bidi/modules/windowglobal-in-root/log.jsm
# remote/webdriver-bidi/modules/windowglobal/browsingContext.jsm
# remote/webdriver-bidi/modules/windowglobal/log.jsm
# services/common/kinto-http-client.js
# services/common/kinto-offline-client.js
# services/sync/tps/extensions/tps/resource/tps.jsm
# testing/modules/Assert.jsm
# testing/modules/StructuredLog.jsm
# toolkit/components/bitsdownload/Bits.jsm
# toolkit/components/crashes/CrashManager.in.jsm
# toolkit/components/ctypes/ctypes.jsm
# toolkit/components/extensions/Extension.jsm
# toolkit/components/formautofill/android/FormAutofillPrompter.jsm
# toolkit/components/formautofill/android/FormAutofillStorage.jsm
# toolkit/components/formautofill/default/FormAutofillPrompter.jsm
# toolkit/components/formautofill/default/FormAutofillStorage.jsm
# toolkit/components/lz4/lz4.js
# toolkit/components/lz4/lz4_internal.js
# toolkit/components/normandy/vendor/PropTypes.js
# toolkit/components/normandy/vendor/React.js
# toolkit/components/normandy/vendor/ReactDOM.js
# toolkit/components/normandy/vendor/classnames.js
# toolkit/components/passwordmgr/PasswordRulesParser.jsm
# toolkit/components/reader/Readerable.jsm
# toolkit/components/utils/mozjexl.js
# toolkit/modules/AppConstants.jsm
# toolkit/modules/subprocess/subprocess_common.jsm
# toolkit/modules/subprocess/subprocess_unix.jsm
# toolkit/modules/subprocess/subprocess_win.jsm
# toolkit/modules/third_party/fathom/fathom.jsm
# toolkit/modules/third_party/jsesc/jsesc.js
# toolkit/mozapps/extensions/addonManager.js
# tools/code-coverage/PerTestCoverageUtils.jsm
# @@

# These files shouldn't be renamed
#
# docshell/test/browser/Bug1622420Child.jsm
# docshell/test/browser/Bug422543Child.jsm
# docshell/test/chrome/DocShellHelpers.jsm
# docshell/test/unit/AllowJavascriptChild.jsm
# docshell/test/unit/AllowJavascriptParent.jsm
# js/xpconnect/tests/chrome/file_expandosharing.jsm
# js/xpconnect/tests/unit/environment_checkscript.jsm
# js/xpconnect/tests/unit/environment_loadscript.jsm
# js/xpconnect/tests/unit/environment_script.js
# js/xpconnect/tests/unit/jsm_loaded-1.jsm
# js/xpconnect/tests/unit/jsm_loaded-2.jsm
# js/xpconnect/tests/unit/jsm_loaded-3.jsm
# js/xpconnect/tests/unit/not-esmified-not-exported.jsm
# js/xpconnect/tests/unit/recursive_importA.jsm
# js/xpconnect/tests/unit/recursive_importB.jsm
# js/xpconnect/tests/unit/uninitialized_lexical.jsm
# toolkit/actors/TestProcessActorChild.jsm
# toolkit/actors/TestProcessActorParent.jsm
# toolkit/actors/TestWindowChild.jsm
# toolkit/actors/TestWindowParent.jsm

FILES=$(cat<<EOF
accessible/tests/browser/Common.jsm
accessible/tests/browser/Layout.jsm
browser/actors/AboutNewTabChild.jsm
browser/actors/AboutNewTabParent.jsm
browser/actors/AboutPluginsChild.jsm
browser/actors/AboutPluginsParent.jsm
browser/actors/AboutPocketChild.jsm
browser/actors/AboutPocketParent.jsm
browser/actors/AboutPrivateBrowsingChild.jsm
browser/actors/AboutPrivateBrowsingParent.jsm
browser/actors/AboutProtectionsChild.jsm
browser/actors/AboutProtectionsParent.jsm
browser/actors/AboutReaderChild.jsm
browser/actors/AboutReaderParent.jsm
browser/actors/AboutTabCrashedChild.jsm
browser/actors/AboutTabCrashedParent.jsm
browser/actors/BlockedSiteChild.jsm
browser/actors/BlockedSiteParent.jsm
browser/actors/BrowserProcessChild.jsm
browser/actors/BrowserTabChild.jsm
browser/actors/BrowserTabParent.jsm
browser/actors/ClickHandlerChild.jsm
browser/actors/ClickHandlerParent.jsm
browser/actors/ContentSearchChild.jsm
browser/actors/ContentSearchParent.jsm
browser/actors/ContextMenuChild.jsm
browser/actors/ContextMenuParent.jsm
browser/actors/DOMFullscreenChild.jsm
browser/actors/DOMFullscreenParent.jsm
browser/actors/DecoderDoctorChild.jsm
browser/actors/DecoderDoctorParent.jsm
browser/actors/EncryptedMediaChild.jsm
browser/actors/EncryptedMediaParent.jsm
browser/actors/FormValidationChild.jsm
browser/actors/FormValidationParent.jsm
browser/actors/LightweightThemeChild.jsm
browser/actors/LinkHandlerChild.jsm
browser/actors/LinkHandlerParent.jsm
browser/actors/NetErrorChild.jsm
browser/actors/NetErrorParent.jsm
browser/actors/PageInfoChild.jsm
browser/actors/PageStyleChild.jsm
browser/actors/PageStyleParent.jsm
browser/actors/PluginChild.jsm
browser/actors/PluginParent.jsm
browser/actors/PointerLockChild.jsm
browser/actors/PointerLockParent.jsm
browser/actors/PromptParent.jsm
browser/actors/RFPHelperChild.jsm
browser/actors/RFPHelperParent.jsm
browser/actors/RefreshBlockerChild.jsm
browser/actors/RefreshBlockerParent.jsm
browser/actors/ScreenshotsComponentChild.jsm
browser/actors/SearchSERPTelemetryChild.jsm
browser/actors/SearchSERPTelemetryParent.jsm
browser/actors/SwitchDocumentDirectionChild.jsm
browser/actors/WebRTCChild.jsm
browser/actors/WebRTCParent.jsm
browser/base/content/test/fullscreen/FullscreenFrame.jsm
browser/base/content/test/performance/StartupContentSubframe.jsm
browser/base/content/test/plugins/BlocklistTestProxy.jsm
browser/components/BrowserContentHandler.jsm
browser/components/BrowserGlue.jsm
browser/components/aboutlogins/AboutLoginsChild.jsm
browser/components/aboutlogins/AboutLoginsParent.jsm
browser/components/aboutlogins/LoginBreaches.jsm
browser/components/aboutlogins/tests/browser/AboutLoginsTestUtils.jsm
browser/components/attribution/AttributionCode.jsm
browser/components/attribution/MacAttribution.jsm
browser/components/colorways/ColorwayClosetOpener.jsm
browser/components/doh/DoHConfig.jsm
browser/components/doh/DoHController.jsm
browser/components/doh/DoHHeuristics.jsm
browser/components/doh/DoHTestUtils.jsm
browser/components/doh/TRRPerformance.jsm
browser/components/downloads/DownloadSpamProtection.jsm
browser/components/downloads/DownloadsCommon.jsm
browser/components/downloads/DownloadsMacFinderProgress.jsm
browser/components/downloads/DownloadsTaskbar.jsm
browser/components/downloads/DownloadsViewUI.jsm
browser/components/downloads/DownloadsViewableInternally.jsm
browser/components/enterprisepolicies/Policies.jsm
browser/components/enterprisepolicies/helpers/BookmarksPolicies.jsm
browser/components/enterprisepolicies/helpers/ProxyPolicies.jsm
browser/components/enterprisepolicies/helpers/WebsiteFilter.jsm
browser/components/extensions/ExtensionBrowsingData.jsm
browser/components/extensions/ExtensionControlledPopup.jsm
browser/components/extensions/ExtensionPopups.jsm
browser/components/extensions/test/AppUiTestDelegate.jsm
browser/components/installerprefs/InstallerPrefs.jsm
browser/components/migration/360seMigrationUtils.jsm
browser/components/migration/ChromeMacOSLoginCrypto.jsm
browser/components/migration/ChromeMigrationUtils.jsm
browser/components/migration/ChromeProfileMigrator.jsm
browser/components/migration/ChromeWindowsLoginCrypto.jsm
browser/components/migration/ESEDBReader.jsm
browser/components/migration/EdgeProfileMigrator.jsm
browser/components/migration/FirefoxProfileMigrator.jsm
browser/components/migration/IEProfileMigrator.jsm
browser/components/migration/MSMigrationUtils.jsm
browser/components/migration/MigrationUtils.jsm
browser/components/migration/ProfileMigrator.jsm
browser/components/migration/SafariProfileMigrator.jsm
browser/components/newtab/AboutNewTabService.jsm
browser/components/newtab/aboutwelcome/AboutWelcomeChild.jsm
browser/components/newtab/aboutwelcome/AboutWelcomeParent.jsm
browser/components/newtab/aboutwelcome/lib/AboutWelcomeDefaults.jsm
browser/components/newtab/aboutwelcome/lib/AboutWelcomeTelemetry.jsm
browser/components/newtab/actors/ASRouterChild.jsm
browser/components/newtab/actors/ASRouterParent.jsm
browser/components/newtab/common/Actions.jsm
browser/components/newtab/common/ActorConstants.jsm
browser/components/newtab/common/Dedupe.jsm
browser/components/newtab/common/Reducers.jsm
browser/components/newtab/lib/ASRouter.jsm
browser/components/newtab/lib/ASRouterDefaultConfig.jsm
browser/components/newtab/lib/ASRouterNewTabHook.jsm
browser/components/newtab/lib/ASRouterParentProcessMessageHandler.jsm
browser/components/newtab/lib/ASRouterPreferences.jsm
browser/components/newtab/lib/ASRouterTargeting.jsm
browser/components/newtab/lib/ASRouterTriggerListeners.jsm
browser/components/newtab/lib/AboutPreferences.jsm
browser/components/newtab/lib/ActivityStream.jsm
browser/components/newtab/lib/ActivityStreamMessageChannel.jsm
browser/components/newtab/lib/ActivityStreamPrefs.jsm
browser/components/newtab/lib/ActivityStreamStorage.jsm
browser/components/newtab/lib/CFRMessageProvider.jsm
browser/components/newtab/lib/CFRPageActions.jsm
browser/components/newtab/lib/DefaultSites.jsm
browser/components/newtab/lib/DiscoveryStreamFeed.jsm
browser/components/newtab/lib/DownloadsManager.jsm
browser/components/newtab/lib/FaviconFeed.jsm
browser/components/newtab/lib/FilterAdult.jsm
browser/components/newtab/lib/HighlightsFeed.jsm
browser/components/newtab/lib/InfoBar.jsm
browser/components/newtab/lib/LinksCache.jsm
browser/components/newtab/lib/MomentsPageHub.jsm
browser/components/newtab/lib/NewTabInit.jsm
browser/components/newtab/lib/OnboardingMessageProvider.jsm
browser/components/newtab/lib/PanelTestProvider.jsm
browser/components/newtab/lib/PersistentCache.jsm
browser/components/newtab/lib/PersonalityProvider/NaiveBayesTextTagger.jsm
browser/components/newtab/lib/PersonalityProvider/NmfTextTagger.jsm
browser/components/newtab/lib/PersonalityProvider/PersonalityProvider.jsm
browser/components/newtab/lib/PersonalityProvider/PersonalityProviderWorkerClass.jsm
browser/components/newtab/lib/PersonalityProvider/RecipeExecutor.jsm
browser/components/newtab/lib/PersonalityProvider/Tokenize.jsm
browser/components/newtab/lib/PlacesFeed.jsm
browser/components/newtab/lib/PrefsFeed.jsm
browser/components/newtab/lib/RecommendationProvider.jsm
browser/components/newtab/lib/RemoteImages.jsm
browser/components/newtab/lib/RemoteL10n.jsm
browser/components/newtab/lib/Screenshots.jsm
browser/components/newtab/lib/SearchShortcuts.jsm
browser/components/newtab/lib/SectionsManager.jsm
browser/components/newtab/lib/ShortURL.jsm
browser/components/newtab/lib/SiteClassifier.jsm
browser/components/newtab/lib/SnippetsTestMessageProvider.jsm
browser/components/newtab/lib/Spotlight.jsm
browser/components/newtab/lib/Store.jsm
browser/components/newtab/lib/SystemTickFeed.jsm
browser/components/newtab/lib/TelemetryFeed.jsm
browser/components/newtab/lib/TippyTopProvider.jsm
browser/components/newtab/lib/ToolbarBadgeHub.jsm
browser/components/newtab/lib/ToolbarPanelHub.jsm
browser/components/newtab/lib/TopSitesFeed.jsm
browser/components/newtab/lib/TopStoriesFeed.jsm
browser/components/newtab/lib/UTEventReporting.jsm
browser/components/newtab/test/RemoteImagesTestUtils.jsm
browser/components/pagedata/OpenGraphPageData.jsm
browser/components/pagedata/PageDataChild.jsm
browser/components/pagedata/PageDataParent.jsm
browser/components/pagedata/PageDataSchema.jsm
browser/components/pagedata/PageDataService.jsm
browser/components/pagedata/SchemaOrgPageData.jsm
browser/components/pagedata/TwitterPageData.jsm
browser/components/places/CommonNames.jsm
browser/components/places/DomainGroupBuilder.jsm
browser/components/places/Interactions.jsm
browser/components/places/InteractionsBlocklist.jsm
browser/components/places/InteractionsChild.jsm
browser/components/places/InteractionsParent.jsm
browser/components/places/PinnedGroupBuilder.jsm
browser/components/places/PlacesUIUtils.jsm
browser/components/places/SnapshotGroups.jsm
browser/components/places/SnapshotMonitor.jsm
browser/components/places/SnapshotScorer.jsm
browser/components/places/SnapshotSelector.jsm
browser/components/places/Snapshots.jsm
browser/components/pocket/content/Pocket.jsm
browser/components/pocket/content/SaveToPocket.jsm
browser/components/pocket/content/pktApi.jsm
browser/components/pocket/content/pktTelemetry.jsm
browser/components/prompts/PromptCollection.jsm
browser/components/protocolhandler/WebProtocolHandlerRegistrar.jsm
browser/components/screenshots/ScreenshotsOverlayChild.jsm
browser/components/screenshots/ScreenshotsUtils.jsm
browser/components/search/BrowserSearchTelemetry.jsm
browser/components/search/SearchOneOffs.jsm
browser/components/search/SearchSERPTelemetry.jsm
browser/components/search/SearchUIUtils.jsm
browser/components/sessionstore/ContentRestore.jsm
browser/components/sessionstore/ContentSessionStore.jsm
browser/components/sessionstore/GlobalState.jsm
browser/components/sessionstore/RecentlyClosedTabsAndWindowsMenuUtils.jsm
browser/components/sessionstore/RunState.jsm
browser/components/sessionstore/SessionCookies.jsm
browser/components/sessionstore/SessionFile.jsm
browser/components/sessionstore/SessionMigration.jsm
browser/components/sessionstore/SessionSaver.jsm
browser/components/sessionstore/SessionStartup.jsm
browser/components/sessionstore/SessionStore.jsm
browser/components/sessionstore/SessionWriter.jsm
browser/components/sessionstore/StartupPerformance.jsm
browser/components/sessionstore/TabAttributes.jsm
browser/components/sessionstore/TabState.jsm
browser/components/sessionstore/TabStateCache.jsm
browser/components/sessionstore/TabStateFlusher.jsm
browser/components/shell/HeadlessShell.jsm
browser/components/shell/ScreenshotChild.jsm
browser/components/shell/ShellService.jsm
browser/components/syncedtabs/EventEmitter.jsm
browser/components/translation/BingTranslator.jsm
browser/components/translation/GoogleTranslator.jsm
browser/components/translation/LanguageDetector.jsm
browser/components/translation/TranslationChild.jsm
browser/components/translation/TranslationDocument.jsm
browser/components/translation/TranslationParent.jsm
browser/components/translation/YandexTranslator.jsm
browser/components/uitour/UITour.jsm
browser/components/uitour/UITourChild.jsm
browser/components/uitour/UITourParent.jsm
browser/extensions/webcompat/about-compat/AboutCompat.jsm
browser/modules/AboutNewTab.jsm
browser/modules/AppUpdater.jsm
browser/modules/AsyncTabSwitcher.jsm
browser/modules/BrowserUIUtils.jsm
browser/modules/BrowserUsageTelemetry.jsm
browser/modules/BrowserWindowTracker.jsm
browser/modules/ContentCrashHandlers.jsm
browser/modules/Discovery.jsm
browser/modules/EveryWindow.jsm
browser/modules/ExtensionsUI.jsm
browser/modules/FaviconLoader.jsm
browser/modules/HomePage.jsm
browser/modules/LaterRun.jsm
browser/modules/NewTabPagePreloading.jsm
browser/modules/OpenInTabsUtils.jsm
browser/modules/PageActions.jsm
browser/modules/PartnerLinkAttribution.jsm
browser/modules/PermissionUI.jsm
browser/modules/PingCentre.jsm
browser/modules/ProcessHangMonitor.jsm
browser/modules/Sanitizer.jsm
browser/modules/SelectionChangedMenulist.jsm
browser/modules/SiteDataManager.jsm
browser/modules/SitePermissions.jsm
browser/modules/TabUnloader.jsm
browser/modules/TabsList.jsm
browser/modules/TransientPrefs.jsm
browser/modules/WindowsJumpLists.jsm
browser/modules/WindowsPreviewPerTab.jsm
browser/modules/ZoomUI.jsm
browser/modules/webrtcUI.jsm
browser/themes/BuiltInThemeConfig.jsm
browser/themes/BuiltInThemes.jsm
browser/themes/ThemeVariableMap.jsm
browser/themes/Windows8WindowFrameColor.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/Screenshot.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/TestRunner.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/AppMenu.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/Buttons.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/ControlCenter.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/CustomizeMode.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/DevTools.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/LightweightThemes.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/PermissionPrompts.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/Preferences.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/Tabs.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/TabsInTitlebar.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/Toolbars.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/UIDensities.jsm
browser/tools/mozscreenshots/mozscreenshots/extension/configurations/WindowSize.jsm
devtools/client/framework/browser-toolbox/Launcher.jsm
devtools/client/jsonview/Converter.jsm
devtools/client/jsonview/Sniffer.jsm
devtools/client/shared/sourceeditor/test/CodeMirrorTestActors.jsm
devtools/client/shared/widgets/AbstractTreeItem.jsm
devtools/client/storage/VariablesView.jsm
devtools/client/styleeditor/StyleEditorUI.jsm
devtools/client/styleeditor/StyleEditorUtil.jsm
devtools/client/styleeditor/StyleSheetEditor.jsm
devtools/server/actors/targets/target-actor-registry.jsm
devtools/server/actors/watcher/SessionDataHelpers.jsm
devtools/server/actors/watcher/WatcherRegistry.jsm
devtools/server/actors/watcher/browsing-context-helpers.jsm
devtools/server/connectors/js-window-actor/DevToolsFrameChild.jsm
devtools/server/connectors/js-window-actor/DevToolsFrameParent.jsm
devtools/server/connectors/js-window-actor/DevToolsWorkerChild.jsm
devtools/server/connectors/js-window-actor/DevToolsWorkerParent.jsm
devtools/server/connectors/js-window-actor/WindowGlobalLogger.jsm
devtools/server/startup/content-process.jsm
devtools/shared/heapsnapshot/tests/xpcshell/Census.jsm
devtools/shared/heapsnapshot/tests/xpcshell/Match.jsm
devtools/shared/loader/loader-plugin-raw.jsm
devtools/shared/security/DevToolsSocketStatus.jsm
devtools/shared/test-helpers/tracked-objects.jsm
devtools/shared/validate-breakpoint.jsm
devtools/startup/AboutDebuggingRegistration.jsm
devtools/startup/AboutDevToolsToolboxRegistration.jsm
devtools/startup/DevToolsShim.jsm
devtools/startup/DevToolsStartup.jsm
docshell/base/URIFixup.jsm
dom/base/ContentAreaDropListener.jsm
dom/base/DOMRequestHelper.jsm
dom/base/IndexedDBHelper.jsm
dom/base/LocationHelper.jsm
dom/base/ProcessSelector.jsm
dom/base/SlowScriptDebug.jsm
dom/browser-element/BrowserElementParent.jsm
dom/browser-element/BrowserElementPromptService.jsm
dom/console/ConsoleAPIStorage.jsm
dom/console/tests/console.jsm
dom/encoding/test/file_stringencoding.jsm
dom/html/HTMLMenuBuilder.jsm
dom/indexedDB/test/unit/GlobalObjectsModule.jsm
dom/ipc/ManifestMessagesChild.jsm
dom/manifest/ImageObjectProcessor.jsm
dom/manifest/Manifest.jsm
dom/manifest/ManifestFinder.jsm
dom/manifest/ManifestIcons.jsm
dom/manifest/ManifestObtainer.jsm
dom/manifest/ManifestProcessor.jsm
dom/manifest/ValueExtractor.jsm
dom/media/IdpSandbox.jsm
dom/media/PeerConnection.jsm
dom/media/PeerConnectionIdp.jsm
dom/media/webvtt/WebVTTParserWrapper.jsm
dom/network/tests/tcpsocket_test.jsm
dom/notification/NotificationStorage.jsm
dom/notification/new/NotificationDB.jsm
dom/notification/old/NotificationDB.jsm
dom/push/Push.jsm
dom/push/PushBroadcastService.jsm
dom/push/PushComponents.jsm
dom/push/PushCrypto.jsm
dom/push/PushDB.jsm
dom/push/PushRecord.jsm
dom/push/PushServiceAndroidGCM.jsm
dom/push/PushServiceHttp2.jsm
dom/push/PushServiceWebSocket.jsm
dom/push/test/xpcshell/broadcast_handler.jsm
dom/quota/test/modules/system/ModuleLoader.jsm
dom/quota/test/modules/system/StorageUtils.jsm
dom/serviceworkers/test/ForceRefreshChild.jsm
dom/serviceworkers/test/ForceRefreshParent.jsm
dom/system/NetworkGeolocationProvider.jsm
dom/url/tests/file_url.jsm
dom/url/tests/file_worker_url.jsm
dom/url/tests/test_bug883784.jsm
dom/workers/test/WorkerTest.jsm
dom/xslt/xslt/txEXSLTRegExFunctions.jsm
extensions/permissions/test/PermissionTestUtils.jsm
gfx/layers/apz/test/mochitest/FissionTestHelperChild.jsm
gfx/layers/apz/test/mochitest/FissionTestHelperParent.jsm
intl/locale/LangPackMatcher.jsm
intl/locale/PluralForm.jsm
intl/locale/tests/LangPackMatcherTestUtils.jsm
js/ductwork/debugger/jsdebugger.jsm
js/xpconnect/loader/ComponentUtils.jsm
js/xpconnect/loader/XPCOMUtils.jsm
layout/tools/layout-debug/LayoutDebugChild.jsm
layout/tools/reftest/ReftestFissionChild.jsm
layout/tools/reftest/ReftestFissionParent.jsm
layout/tools/reftest/globals.jsm
layout/tools/reftest/manifest.jsm
layout/tools/reftest/reftest.jsm
mobile/android/actors/ContentDelegateChild.jsm
mobile/android/actors/ContentDelegateParent.jsm
mobile/android/actors/GeckoViewAutoFillChild.jsm
mobile/android/actors/GeckoViewAutoFillParent.jsm
mobile/android/actors/GeckoViewContentChild.jsm
mobile/android/actors/GeckoViewContentParent.jsm
mobile/android/actors/GeckoViewFormValidationChild.jsm
mobile/android/actors/GeckoViewPermissionChild.jsm
mobile/android/actors/GeckoViewPermissionParent.jsm
mobile/android/actors/GeckoViewPermissionProcessChild.jsm
mobile/android/actors/GeckoViewPermissionProcessParent.jsm
mobile/android/actors/GeckoViewPromptChild.jsm
mobile/android/actors/GeckoViewPrompterChild.jsm
mobile/android/actors/GeckoViewPrompterParent.jsm
mobile/android/actors/GeckoViewSettingsChild.jsm
mobile/android/actors/LoadURIDelegateChild.jsm
mobile/android/actors/LoadURIDelegateParent.jsm
mobile/android/actors/MediaControlDelegateChild.jsm
mobile/android/actors/MediaControlDelegateParent.jsm
mobile/android/actors/ProgressDelegateChild.jsm
mobile/android/actors/ProgressDelegateParent.jsm
mobile/android/actors/ScrollDelegateChild.jsm
mobile/android/actors/ScrollDelegateParent.jsm
mobile/android/actors/SelectionActionDelegateChild.jsm
mobile/android/actors/SelectionActionDelegateParent.jsm
mobile/android/components/extensions/ExtensionBrowsingData.jsm
mobile/android/components/geckoview/ColorPickerDelegate.jsm
mobile/android/components/geckoview/FilePickerDelegate.jsm
mobile/android/components/geckoview/GeckoViewPermission.jsm
mobile/android/components/geckoview/GeckoViewPrompt.jsm
mobile/android/components/geckoview/GeckoViewPrompter.jsm
mobile/android/components/geckoview/GeckoViewPush.jsm
mobile/android/components/geckoview/GeckoViewStartup.jsm
mobile/android/components/geckoview/LoginStorageDelegate.jsm
mobile/android/components/geckoview/PromptCollection.jsm
mobile/android/components/geckoview/ShareDelegate.jsm
mobile/android/geckoview/src/androidTest/assets/web_extensions/test-support/TestSupportChild.jsm
mobile/android/geckoview/src/androidTest/assets/web_extensions/test-support/TestSupportProcessChild.jsm
mobile/android/modules/geckoview/BrowserUsageTelemetry.jsm
mobile/android/modules/geckoview/ChildCrashHandler.jsm
mobile/android/modules/geckoview/DelayedInit.jsm
mobile/android/modules/geckoview/GeckoViewActorChild.jsm
mobile/android/modules/geckoview/GeckoViewActorManager.jsm
mobile/android/modules/geckoview/GeckoViewActorParent.jsm
mobile/android/modules/geckoview/GeckoViewAutocomplete.jsm
mobile/android/modules/geckoview/GeckoViewAutofill.jsm
mobile/android/modules/geckoview/GeckoViewChildModule.jsm
mobile/android/modules/geckoview/GeckoViewConsole.jsm
mobile/android/modules/geckoview/GeckoViewContent.jsm
mobile/android/modules/geckoview/GeckoViewContentBlocking.jsm
mobile/android/modules/geckoview/GeckoViewMediaControl.jsm
mobile/android/modules/geckoview/GeckoViewModule.jsm
mobile/android/modules/geckoview/GeckoViewNavigation.jsm
mobile/android/modules/geckoview/GeckoViewProcessHangMonitor.jsm
mobile/android/modules/geckoview/GeckoViewProgress.jsm
mobile/android/modules/geckoview/GeckoViewPushController.jsm
mobile/android/modules/geckoview/GeckoViewRemoteDebugger.jsm
mobile/android/modules/geckoview/GeckoViewSelectionAction.jsm
mobile/android/modules/geckoview/GeckoViewSettings.jsm
mobile/android/modules/geckoview/GeckoViewStorageController.jsm
mobile/android/modules/geckoview/GeckoViewTab.jsm
mobile/android/modules/geckoview/GeckoViewTelemetry.jsm
mobile/android/modules/geckoview/GeckoViewUtils.jsm
mobile/android/modules/geckoview/GeckoViewWebExtension.jsm
mobile/android/modules/geckoview/LoadURIDelegate.jsm
mobile/android/modules/geckoview/MediaUtils.jsm
mobile/android/modules/geckoview/Messaging.jsm
mobile/android/modules/test/AppUiTestDelegate.jsm
netwerk/base/NetUtil.jsm
netwerk/cookie/CookieXPCShellUtils.jsm
netwerk/dns/PublicSuffixList.jsm
netwerk/protocol/http/WellKnownOpportunisticUtils.jsm
netwerk/test/browser/early_hint_preload_test_helper.jsm
netwerk/url-classifier/UrlClassifierExceptionListService.jsm
remote/components/Marionette.jsm
remote/components/RemoteAgent.jsm
remote/marionette/actors/MarionetteCommandsChild.jsm
remote/marionette/actors/MarionetteCommandsParent.jsm
remote/marionette/actors/MarionetteEventsChild.jsm
remote/marionette/actors/MarionetteEventsParent.jsm
remote/marionette/actors/MarionetteReftestChild.jsm
remote/marionette/actors/MarionetteReftestParent.jsm
remote/server/WebSocketHandshake.jsm
remote/server/WebSocketTransport.jsm
remote/shared/Format.jsm
remote/shared/Log.jsm
remote/shared/MobileTabBrowser.jsm
remote/shared/Navigate.jsm
remote/shared/PDF.jsm
remote/shared/RecommendedPreferences.jsm
remote/shared/Stack.jsm
remote/shared/Sync.jsm
remote/shared/TabManager.jsm
remote/shared/WebSocketConnection.jsm
remote/shared/WindowManager.jsm
remote/shared/listeners/BrowsingContextListener.jsm
remote/shared/listeners/ConsoleAPIListener.jsm
remote/shared/listeners/ConsoleListener.jsm
remote/shared/listeners/LoadListener.jsm
remote/shared/messagehandler/EventsDispatcher.jsm
remote/shared/messagehandler/MessageHandler.jsm
remote/shared/messagehandler/MessageHandlerRegistry.jsm
remote/shared/messagehandler/Module.jsm
remote/shared/messagehandler/ModuleCache.jsm
remote/shared/messagehandler/RootMessageHandler.jsm
remote/shared/messagehandler/RootMessageHandlerRegistry.jsm
remote/shared/messagehandler/WindowGlobalMessageHandler.jsm
remote/shared/messagehandler/sessiondata/SessionData.jsm
remote/shared/messagehandler/sessiondata/SessionDataReader.jsm
remote/shared/messagehandler/test/browser/resources/modules/ModuleRegistry.jsm
remote/shared/messagehandler/test/browser/resources/modules/root/command.jsm
remote/shared/messagehandler/test/browser/resources/modules/root/event.jsm
remote/shared/messagehandler/test/browser/resources/modules/root/rootOnly.jsm
remote/shared/messagehandler/test/browser/resources/modules/windowglobal-in-root/command.jsm
remote/shared/messagehandler/test/browser/resources/modules/windowglobal-in-root/event.jsm
remote/shared/messagehandler/test/browser/resources/modules/windowglobal/command.jsm
remote/shared/messagehandler/test/browser/resources/modules/windowglobal/commandwindowglobalonly.jsm
remote/shared/messagehandler/test/browser/resources/modules/windowglobal/event.jsm
remote/shared/messagehandler/test/browser/resources/modules/windowglobal/internaleventemitter.jsm
remote/shared/messagehandler/test/browser/resources/modules/windowglobal/retry.jsm
remote/shared/messagehandler/transports/FrameContextUtils.jsm
remote/shared/messagehandler/transports/FrameTransport.jsm
remote/shared/messagehandler/transports/js-window-actors/MessageHandlerFrameActor.jsm
remote/shared/messagehandler/transports/js-window-actors/MessageHandlerFrameChild.jsm
remote/shared/messagehandler/transports/js-window-actors/MessageHandlerFrameParent.jsm
security/manager/ssl/DER.jsm
security/manager/ssl/RemoteSecuritySettings.jsm
security/manager/ssl/X509.jsm
services/automation/ServicesAutomation.jsm
services/crypto/modules/jwcrypto.jsm
services/fxaccounts/Credentials.jsm
services/fxaccounts/FxAccounts.jsm
services/fxaccounts/FxAccountsClient.jsm
services/fxaccounts/FxAccountsConfig.jsm
services/fxaccounts/FxAccountsDevice.jsm
services/fxaccounts/FxAccountsKeys.jsm
services/fxaccounts/FxAccountsPairing.jsm
services/fxaccounts/FxAccountsProfile.jsm
services/fxaccounts/FxAccountsProfileClient.jsm
services/fxaccounts/FxAccountsPush.jsm
services/fxaccounts/FxAccountsStorage.jsm
services/fxaccounts/FxAccountsTelemetry.jsm
services/fxaccounts/FxAccountsWebChannel.jsm
services/settings/Attachments.jsm
services/settings/Database.jsm
services/settings/IDBHelpers.jsm
services/settings/RemoteSettingsClient.jsm
services/settings/RemoteSettingsComponents.jsm
services/settings/RemoteSettingsWorker.jsm
services/settings/SharedUtils.jsm
services/settings/SyncHistory.jsm
services/settings/Utils.jsm
services/sync/Weave.jsm
services/sync/modules/SyncDisconnect.jsm
services/sync/modules/SyncedTabs.jsm
services/sync/modules/UIState.jsm
services/sync/tps/extensions/tps/resource/auth/fxaccounts.jsm
services/sync/tps/extensions/tps/resource/logger.jsm
services/sync/tps/extensions/tps/resource/modules/addons.jsm
services/sync/tps/extensions/tps/resource/modules/bookmarks.jsm
services/sync/tps/extensions/tps/resource/modules/formautofill.jsm
services/sync/tps/extensions/tps/resource/modules/forms.jsm
services/sync/tps/extensions/tps/resource/modules/history.jsm
services/sync/tps/extensions/tps/resource/modules/passwords.jsm
services/sync/tps/extensions/tps/resource/modules/prefs.jsm
services/sync/tps/extensions/tps/resource/modules/tabs.jsm
services/sync/tps/extensions/tps/resource/modules/windows.jsm
testing/mochitest/BrowserTestUtils/BrowserTestUtils.jsm
testing/mochitest/BrowserTestUtils/BrowserTestUtilsChild.jsm
testing/mochitest/BrowserTestUtils/BrowserTestUtilsParent.jsm
testing/mochitest/BrowserTestUtils/ContentEventListenerChild.jsm
testing/mochitest/BrowserTestUtils/ContentEventListenerParent.jsm
testing/mochitest/BrowserTestUtils/ContentTask.jsm
testing/mochitest/BrowserTestUtils/ContentTaskUtils.jsm
testing/mochitest/ShutdownLeaksCollector.jsm
testing/mochitest/tests/Harness_sanity/ImportTesting.jsm
testing/modules/AppData.jsm
testing/modules/AppInfo.jsm
testing/modules/CoverageUtils.jsm
testing/modules/FileTestUtils.jsm
testing/modules/MockRegistrar.jsm
testing/modules/MockRegistry.jsm
testing/modules/Sinon.jsm
testing/modules/TestUtils.jsm
testing/modules/XPCShellContentUtils.jsm
testing/specialpowers/content/AppTestDelegate.jsm
testing/specialpowers/content/AppTestDelegateChild.jsm
testing/specialpowers/content/AppTestDelegateParent.jsm
testing/specialpowers/content/MockColorPicker.jsm
testing/specialpowers/content/MockFilePicker.jsm
testing/specialpowers/content/MockPermissionPrompt.jsm
testing/specialpowers/content/SpecialPowersChild.jsm
testing/specialpowers/content/SpecialPowersEventUtils.jsm
testing/specialpowers/content/SpecialPowersParent.jsm
testing/specialpowers/content/SpecialPowersSandbox.jsm
testing/specialpowers/content/WrapPrivileged.jsm
testing/talos/talos/talos-powers/content/TalosParentProfiler.jsm
testing/talos/talos/tests/devtools/addon/content/actors/DampLoadChild.jsm
testing/talos/talos/tests/devtools/addon/content/actors/DampLoadParent.jsm
testing/xpcshell/example/unit/import_module.jsm
toolkit/actors/AboutHttpsOnlyErrorChild.jsm
toolkit/actors/AboutHttpsOnlyErrorParent.jsm
toolkit/actors/AudioPlaybackChild.jsm
toolkit/actors/AudioPlaybackParent.jsm
toolkit/actors/AutoCompleteChild.jsm
toolkit/actors/AutoCompleteParent.jsm
toolkit/actors/AutoScrollChild.jsm
toolkit/actors/AutoScrollParent.jsm
toolkit/actors/AutoplayChild.jsm
toolkit/actors/AutoplayParent.jsm
toolkit/actors/BackgroundThumbnailsChild.jsm
toolkit/actors/BrowserElementChild.jsm
toolkit/actors/BrowserElementParent.jsm
toolkit/actors/ContentMetaChild.jsm
toolkit/actors/ContentMetaParent.jsm
toolkit/actors/ControllersChild.jsm
toolkit/actors/ControllersParent.jsm
toolkit/actors/DateTimePickerChild.jsm
toolkit/actors/DateTimePickerParent.jsm
toolkit/actors/ExtFindChild.jsm
toolkit/actors/FindBarChild.jsm
toolkit/actors/FindBarParent.jsm
toolkit/actors/FinderChild.jsm
toolkit/actors/InlineSpellCheckerChild.jsm
toolkit/actors/InlineSpellCheckerParent.jsm
toolkit/actors/KeyPressEventModelCheckerChild.jsm
toolkit/actors/PictureInPictureChild.jsm
toolkit/actors/PopupBlockingChild.jsm
toolkit/actors/PopupBlockingParent.jsm
toolkit/actors/PrintingChild.jsm
toolkit/actors/PrintingParent.jsm
toolkit/actors/PrintingSelectionChild.jsm
toolkit/actors/PurgeSessionHistoryChild.jsm
toolkit/actors/RemotePageChild.jsm
toolkit/actors/SelectChild.jsm
toolkit/actors/SelectParent.jsm
toolkit/actors/ThumbnailsChild.jsm
toolkit/actors/UAWidgetsChild.jsm
toolkit/actors/UnselectedTabHoverChild.jsm
toolkit/actors/UnselectedTabHoverParent.jsm
toolkit/actors/ViewSourceChild.jsm
toolkit/actors/ViewSourcePageChild.jsm
toolkit/actors/ViewSourcePageParent.jsm
toolkit/actors/WebChannelChild.jsm
toolkit/actors/WebChannelParent.jsm
toolkit/components/DefaultCLH.jsm
toolkit/components/antitracking/ContentBlockingAllowList.jsm
toolkit/components/antitracking/PartitioningExceptionListService.jsm
toolkit/components/antitracking/PurgeTrackerService.jsm
toolkit/components/antitracking/TrackingDBService.jsm
toolkit/components/antitracking/URLDecorationAnnotationsService.jsm
toolkit/components/antitracking/URLQueryStrippingListService.jsm
toolkit/components/asyncshutdown/AsyncShutdown.jsm
toolkit/components/asyncshutdown/nsAsyncShutdown.jsm
toolkit/components/autocomplete/AutoCompleteSimpleSearch.jsm
toolkit/components/backgroundhangmonitor/BHRTelemetryService.jsm
toolkit/components/backgroundtasks/BackgroundTask_exception.jsm
toolkit/components/backgroundtasks/BackgroundTask_failure.jsm
toolkit/components/backgroundtasks/BackgroundTask_success.jsm
toolkit/components/backgroundtasks/BackgroundTasksManager.jsm
toolkit/components/backgroundtasks/BackgroundTasksTestUtils.jsm
toolkit/components/backgroundtasks/BackgroundTasksUtils.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_backgroundtask_specific_pref.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_crash.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_file_exists.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_jsdebugger.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_policies.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_profile_is_slim.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_shouldnotprocessupdates.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_shouldprocessupdates.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_timeout.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_unique_profile.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_update_sync_manager.jsm
toolkit/components/backgroundtasks/tests/BackgroundTask_wait.jsm
toolkit/components/captivedetect/CaptiveDetect.jsm
toolkit/components/certviewer/AboutCertViewerChild.jsm
toolkit/components/certviewer/AboutCertViewerParent.jsm
toolkit/components/cleardata/ClearDataService.jsm
toolkit/components/cleardata/PrincipalsCollector.jsm
toolkit/components/cleardata/ServiceWorkerCleanUp.jsm
toolkit/components/cleardata/SiteDataTestUtils.jsm
toolkit/components/contentprefs/ContentPrefService2.jsm
toolkit/components/contentprefs/ContentPrefServiceChild.jsm
toolkit/components/contentprefs/ContentPrefServiceParent.jsm
toolkit/components/contentprefs/ContentPrefStore.jsm
toolkit/components/contentprefs/ContentPrefUtils.jsm
toolkit/components/contentprefs/tests/unit_cps2/AsyncRunner.jsm
toolkit/components/contextualidentity/ContextualIdentityService.jsm
toolkit/components/corroborator/Corroborate.jsm
toolkit/components/crashes/CrashManagerTest.jsm
toolkit/components/crashes/CrashService.jsm
toolkit/components/crashmonitor/CrashMonitor.jsm
toolkit/components/crashmonitor/nsCrashMonitor.jsm
toolkit/components/downloads/DownloadCore.jsm
toolkit/components/downloads/DownloadHistory.jsm
toolkit/components/downloads/DownloadIntegration.jsm
toolkit/components/downloads/DownloadLegacy.jsm
toolkit/components/downloads/DownloadList.jsm
toolkit/components/downloads/DownloadPaths.jsm
toolkit/components/downloads/DownloadStore.jsm
toolkit/components/downloads/DownloadUIHelper.jsm
toolkit/components/downloads/Downloads.jsm
toolkit/components/enterprisepolicies/EnterprisePolicies.jsm
toolkit/components/enterprisepolicies/EnterprisePoliciesContent.jsm
toolkit/components/enterprisepolicies/EnterprisePoliciesParent.jsm
toolkit/components/enterprisepolicies/WindowsGPOParser.jsm
toolkit/components/enterprisepolicies/macOSPoliciesParser.jsm
toolkit/components/enterprisepolicies/tests/EnterprisePolicyTesting.jsm
toolkit/components/extensions/ConduitsChild.jsm
toolkit/components/extensions/ConduitsParent.jsm
toolkit/components/extensions/ExtensionActions.jsm
toolkit/components/extensions/ExtensionActivityLog.jsm
toolkit/components/extensions/ExtensionChild.jsm
toolkit/components/extensions/ExtensionChildDevToolsUtils.jsm
toolkit/components/extensions/ExtensionCommon.jsm
toolkit/components/extensions/ExtensionContent.jsm
toolkit/components/extensions/ExtensionPageChild.jsm
toolkit/components/extensions/ExtensionParent.jsm
toolkit/components/extensions/ExtensionPermissions.jsm
toolkit/components/extensions/ExtensionPreferencesManager.jsm
toolkit/components/extensions/ExtensionProcessScript.jsm
toolkit/components/extensions/ExtensionSettingsStore.jsm
toolkit/components/extensions/ExtensionShortcuts.jsm
toolkit/components/extensions/ExtensionStorage.jsm
toolkit/components/extensions/ExtensionStorageIDB.jsm
toolkit/components/extensions/ExtensionStorageSync.jsm
toolkit/components/extensions/ExtensionStorageSyncKinto.jsm
toolkit/components/extensions/ExtensionTelemetry.jsm
toolkit/components/extensions/ExtensionTestCommon.jsm
toolkit/components/extensions/ExtensionUtils.jsm
toolkit/components/extensions/ExtensionWorkerChild.jsm
toolkit/components/extensions/ExtensionXPCShellUtils.jsm
toolkit/components/extensions/FindContent.jsm
toolkit/components/extensions/MatchURLFilters.jsm
toolkit/components/extensions/MessageChannel.jsm
toolkit/components/extensions/MessageManagerProxy.jsm
toolkit/components/extensions/NativeManifests.jsm
toolkit/components/extensions/NativeMessaging.jsm
toolkit/components/extensions/PerformanceCounters.jsm
toolkit/components/extensions/ProxyChannelFilter.jsm
toolkit/components/extensions/Schemas.jsm
toolkit/components/extensions/WebNavigation.jsm
toolkit/components/extensions/WebNavigationFrames.jsm
toolkit/components/extensions/storage/ExtensionStorageComponents.jsm
toolkit/components/extensions/test/mochitest/webrequest_test.jsm
toolkit/components/extensions/test/xpcshell/data/TestWorkerWatcherChild.jsm
toolkit/components/extensions/test/xpcshell/data/TestWorkerWatcherParent.jsm
toolkit/components/extensions/webrequest/SecurityInfo.jsm
toolkit/components/extensions/webrequest/WebRequest.jsm
toolkit/components/extensions/webrequest/WebRequestUpload.jsm
toolkit/components/featuregates/FeatureGate.jsm
toolkit/components/featuregates/FeatureGateImplementation.jsm
toolkit/components/forgetaboutsite/ForgetAboutSite.jsm
toolkit/components/formautofill/CreditCardRuleset.jsm
toolkit/components/formautofill/FormAutofill.jsm
toolkit/components/formautofill/FormAutofillChild.jsm
toolkit/components/formautofill/FormAutofillContent.jsm
toolkit/components/formautofill/FormAutofillHandler.jsm
toolkit/components/formautofill/FormAutofillHeuristics.jsm
toolkit/components/formautofill/FormAutofillNameUtils.jsm
toolkit/components/formautofill/FormAutofillParent.jsm
toolkit/components/formautofill/FormAutofillPreferences.jsm
toolkit/components/formautofill/FormAutofillStorageBase.jsm
toolkit/components/formautofill/FormAutofillSync.jsm
toolkit/components/formautofill/FormAutofillTelemetryUtils.jsm
toolkit/components/formautofill/FormAutofillUtils.jsm
toolkit/components/formautofill/ProfileAutoCompleteResult.jsm
toolkit/components/formautofill/phonenumberutils/PhoneNumber.jsm
toolkit/components/formautofill/phonenumberutils/PhoneNumberMetaData.jsm
toolkit/components/formautofill/phonenumberutils/PhoneNumberNormalizer.jsm
toolkit/components/gfx/SanityTest.jsm
toolkit/components/kvstore/kvstore.jsm
toolkit/components/messaging-system/lib/Logger.jsm
toolkit/components/messaging-system/lib/SpecialMessageActions.jsm
toolkit/components/messaging-system/targeting/Targeting.jsm
toolkit/components/mozintl/mozIntl.jsm
toolkit/components/mozprotocol/MozProtocolHandler.jsm
toolkit/components/narrate/NarrateControls.jsm
toolkit/components/narrate/Narrator.jsm
toolkit/components/narrate/VoiceSelect.jsm
toolkit/components/narrate/test/NarrateTestUtils.jsm
toolkit/components/normandy/Normandy.jsm
toolkit/components/normandy/NormandyMigrations.jsm
toolkit/components/normandy/ShieldContentProcess.jsm
toolkit/components/normandy/actions/AddonRollbackAction.jsm
toolkit/components/normandy/actions/AddonRolloutAction.jsm
toolkit/components/normandy/actions/BaseAction.jsm
toolkit/components/normandy/actions/BaseStudyAction.jsm
toolkit/components/normandy/actions/BranchedAddonStudyAction.jsm
toolkit/components/normandy/actions/ConsoleLogAction.jsm
toolkit/components/normandy/actions/MessagingExperimentAction.jsm
toolkit/components/normandy/actions/PreferenceExperimentAction.jsm
toolkit/components/normandy/actions/PreferenceRollbackAction.jsm
toolkit/components/normandy/actions/PreferenceRolloutAction.jsm
toolkit/components/normandy/actions/ShowHeartbeatAction.jsm
toolkit/components/normandy/content/AboutPages.jsm
toolkit/components/normandy/content/ShieldFrameChild.jsm
toolkit/components/normandy/content/ShieldFrameParent.jsm
toolkit/components/normandy/lib/ActionsManager.jsm
toolkit/components/normandy/lib/AddonRollouts.jsm
toolkit/components/normandy/lib/AddonStudies.jsm
toolkit/components/normandy/lib/CleanupManager.jsm
toolkit/components/normandy/lib/ClientEnvironment.jsm
toolkit/components/normandy/lib/EventEmitter.jsm
toolkit/components/normandy/lib/Heartbeat.jsm
toolkit/components/normandy/lib/LogManager.jsm
toolkit/components/normandy/lib/NormandyAddonManager.jsm
toolkit/components/normandy/lib/NormandyApi.jsm
toolkit/components/normandy/lib/NormandyUtils.jsm
toolkit/components/normandy/lib/PrefUtils.jsm
toolkit/components/normandy/lib/PreferenceExperiments.jsm
toolkit/components/normandy/lib/PreferenceRollouts.jsm
toolkit/components/normandy/lib/RecipeRunner.jsm
toolkit/components/normandy/lib/ShieldPreferences.jsm
toolkit/components/normandy/lib/Storage.jsm
toolkit/components/normandy/lib/TelemetryEvents.jsm
toolkit/components/normandy/lib/Uptake.jsm
toolkit/components/normandy/test/NormandyTestUtils.jsm
toolkit/components/osfile/modules/osfile_async_front.jsm
toolkit/components/osfile/modules/osfile_native.jsm
toolkit/components/passwordmgr/InsecurePasswordUtils.jsm
toolkit/components/passwordmgr/LoginAutoComplete.jsm
toolkit/components/passwordmgr/LoginCSVImport.jsm
toolkit/components/passwordmgr/LoginExport.jsm
toolkit/components/passwordmgr/LoginFormFactory.jsm
toolkit/components/passwordmgr/LoginHelper.jsm
toolkit/components/passwordmgr/LoginInfo.jsm
toolkit/components/passwordmgr/LoginManager.jsm
toolkit/components/passwordmgr/LoginManagerAuthPrompter.jsm
toolkit/components/passwordmgr/LoginManagerChild.jsm
toolkit/components/passwordmgr/LoginManagerContextMenu.jsm
toolkit/components/passwordmgr/LoginManagerParent.jsm
toolkit/components/passwordmgr/LoginManagerPrompter.jsm
toolkit/components/passwordmgr/LoginRecipes.jsm
toolkit/components/passwordmgr/LoginRelatedRealms.jsm
toolkit/components/passwordmgr/LoginStore.jsm
toolkit/components/passwordmgr/NewPasswordModel.jsm
toolkit/components/passwordmgr/OSCrypto.jsm
toolkit/components/passwordmgr/OSCrypto_win.jsm
toolkit/components/passwordmgr/PasswordGenerator.jsm
toolkit/components/passwordmgr/PasswordRulesManager.jsm
toolkit/components/passwordmgr/test/LoginTestUtils.jsm
toolkit/components/pdfjs/content/PdfJs.jsm
toolkit/components/pdfjs/content/PdfJsDefaultPreferences.jsm
toolkit/components/pdfjs/content/PdfJsNetwork.jsm
toolkit/components/pdfjs/content/PdfJsTelemetry.jsm
toolkit/components/pdfjs/content/PdfSandbox.jsm
toolkit/components/pdfjs/content/PdfStreamConverter.jsm
toolkit/components/pdfjs/content/PdfjsChild.jsm
toolkit/components/pdfjs/content/PdfjsParent.jsm
toolkit/components/pictureinpicture/PictureInPicture.jsm
toolkit/components/pictureinpicture/PictureInPictureControls.jsm
toolkit/components/places/BookmarkHTMLUtils.jsm
toolkit/components/places/BookmarkJSONUtils.jsm
toolkit/components/places/Bookmarks.jsm
toolkit/components/places/ExtensionSearchHandler.jsm
toolkit/components/places/History.jsm
toolkit/components/places/PlacesBackups.jsm
toolkit/components/places/PlacesDBUtils.jsm
toolkit/components/places/PlacesExpiration.jsm
toolkit/components/places/PlacesPreviews.jsm
toolkit/components/places/PlacesSyncUtils.jsm
toolkit/components/places/PlacesTransactions.jsm
toolkit/components/places/PlacesUtils.jsm
toolkit/components/places/SyncedBookmarksMirror.jsm
toolkit/components/places/TaggingService.jsm
toolkit/components/places/tests/PlacesTestUtils.jsm
toolkit/components/processsingleton/CustomElementsListener.jsm
toolkit/components/processsingleton/MainProcessSingleton.jsm
toolkit/components/promiseworker/PromiseWorker.jsm
toolkit/components/prompts/content/tabprompts.jsm
toolkit/components/prompts/src/CommonDialog.jsm
toolkit/components/prompts/src/Prompter.jsm
toolkit/components/prompts/src/SharedPromptUtils.jsm
toolkit/components/prompts/test/PromptTestUtils.jsm
toolkit/components/reader/AboutReader.jsm
toolkit/components/reader/ReaderMode.jsm
toolkit/components/reader/ReaderWorker.jsm
toolkit/components/reflect/reflect.jsm
toolkit/components/remotebrowserutils/RemoteWebNavigation.jsm
toolkit/components/remotepagemanager/MessagePort.jsm
toolkit/components/remotepagemanager/RemotePageManagerChild.jsm
toolkit/components/remotepagemanager/RemotePageManagerParent.jsm
toolkit/components/resistfingerprinting/RFPHelper.jsm
toolkit/components/satchel/FormAutoComplete.jsm
toolkit/components/satchel/FormHistory.jsm
toolkit/components/satchel/FormHistoryChild.jsm
toolkit/components/satchel/FormHistoryParent.jsm
toolkit/components/satchel/FormHistoryStartup.jsm
toolkit/components/satchel/InputListAutoComplete.jsm
toolkit/components/satchel/nsFormAutoCompleteResult.jsm
toolkit/components/satchel/test/FormHistoryTestUtils.jsm
toolkit/components/search/OpenSearchEngine.jsm
toolkit/components/search/SearchEngine.jsm
toolkit/components/search/SearchEngineSelector.jsm
toolkit/components/search/SearchService.jsm
toolkit/components/search/SearchSettings.jsm
toolkit/components/search/SearchStaticData.jsm
toolkit/components/search/SearchSuggestionController.jsm
toolkit/components/search/SearchSuggestions.jsm
toolkit/components/search/SearchUtils.jsm
toolkit/components/search/tests/SearchTestUtils.jsm
toolkit/components/sessionstore/SessionStoreFunctions.jsm
toolkit/components/taskscheduler/TaskScheduler.jsm
toolkit/components/taskscheduler/TaskSchedulerMacOSImpl.jsm
toolkit/components/taskscheduler/TaskSchedulerWinImpl.jsm
toolkit/components/telemetry/TelemetryStartup.jsm
toolkit/components/telemetry/app/ClientID.jsm
toolkit/components/telemetry/app/TelemetryArchive.jsm
toolkit/components/telemetry/app/TelemetryController.jsm
toolkit/components/telemetry/app/TelemetryControllerBase.jsm
toolkit/components/telemetry/app/TelemetryControllerContent.jsm
toolkit/components/telemetry/app/TelemetryControllerParent.jsm
toolkit/components/telemetry/app/TelemetryEnvironment.jsm
toolkit/components/telemetry/app/TelemetryReportingPolicy.jsm
toolkit/components/telemetry/app/TelemetryScheduler.jsm
toolkit/components/telemetry/app/TelemetrySend.jsm
toolkit/components/telemetry/app/TelemetryStorage.jsm
toolkit/components/telemetry/app/TelemetryTimestamps.jsm
toolkit/components/telemetry/app/TelemetryUtils.jsm
toolkit/components/telemetry/pings/BackgroundTask_pingsender.jsm
toolkit/components/telemetry/pings/CoveragePing.jsm
toolkit/components/telemetry/pings/EventPing.jsm
toolkit/components/telemetry/pings/HealthPing.jsm
toolkit/components/telemetry/pings/ModulesPing.jsm
toolkit/components/telemetry/pings/PrioPing.jsm
toolkit/components/telemetry/pings/TelemetrySession.jsm
toolkit/components/telemetry/pings/UninstallPing.jsm
toolkit/components/telemetry/pings/UntrustedModulesPing.jsm
toolkit/components/telemetry/pings/UpdatePing.jsm
toolkit/components/telemetry/tests/unit/TelemetryArchiveTesting.jsm
toolkit/components/telemetry/tests/unit/TelemetryEnvironmentTesting.jsm
toolkit/components/telemetry/tests/utils/TelemetryTestUtils.jsm
toolkit/components/terminator/TerminatorTelemetry.jsm
toolkit/components/thumbnails/BackgroundPageThumbs.jsm
toolkit/components/thumbnails/PageThumbUtils.jsm
toolkit/components/thumbnails/PageThumbs.jsm
toolkit/components/thumbnails/PageThumbsStorageService.jsm
toolkit/components/timermanager/UpdateTimerManager.jsm
toolkit/components/tooltiptext/TooltipTextProvider.jsm
toolkit/components/url-classifier/SafeBrowsing.jsm
toolkit/components/url-classifier/UrlClassifierHashCompleter.jsm
toolkit/components/url-classifier/UrlClassifierLib.jsm
toolkit/components/url-classifier/UrlClassifierListManager.jsm
toolkit/components/url-classifier/tests/UrlClassifierTestUtils.jsm
toolkit/components/urlformatter/URLFormatter.jsm
toolkit/components/utils/ClientEnvironment.jsm
toolkit/components/utils/FilterExpressions.jsm
toolkit/components/utils/JsonSchemaValidator.jsm
toolkit/components/utils/PreferenceFilters.jsm
toolkit/components/utils/Sampling.jsm
toolkit/components/utils/WindowsInstallsInfo.jsm
toolkit/components/utils/WindowsVersionInfo.jsm
toolkit/components/xulstore/new/XULStore.jsm
toolkit/components/xulstore/old/XULStore.jsm
toolkit/crashreporter/CrashReports.jsm
toolkit/crashreporter/CrashSubmit.jsm
toolkit/crashreporter/test/CrashTestUtils.jsm
toolkit/modules/AboutPagesUtils.jsm
toolkit/modules/ActorManagerParent.jsm
toolkit/modules/AppMenuNotifications.jsm
toolkit/modules/AsanReporter.jsm
toolkit/modules/AsyncPrefs.jsm
toolkit/modules/BinarySearch.jsm
toolkit/modules/BrowserTelemetryUtils.jsm
toolkit/modules/BrowserUtils.jsm
toolkit/modules/CanonicalJSON.jsm
toolkit/modules/CertUtils.jsm
toolkit/modules/Color.jsm
toolkit/modules/Console.jsm
toolkit/modules/ContentDOMReference.jsm
toolkit/modules/CreditCard.jsm
toolkit/modules/DateTimePickerPanel.jsm
toolkit/modules/DeferredTask.jsm
toolkit/modules/Deprecated.jsm
toolkit/modules/E10SUtils.jsm
toolkit/modules/EventEmitter.jsm
toolkit/modules/FileUtils.jsm
toolkit/modules/FindBarContent.jsm
toolkit/modules/Finder.jsm
toolkit/modules/FinderHighlighter.jsm
toolkit/modules/FinderIterator.jsm
toolkit/modules/FinderParent.jsm
toolkit/modules/FirstStartup.jsm
toolkit/modules/FormLikeFactory.jsm
toolkit/modules/GMPInstallManager.jsm
toolkit/modules/GMPUtils.jsm
toolkit/modules/Geometry.jsm
toolkit/modules/HiddenFrame.jsm
toolkit/modules/Http.jsm
toolkit/modules/IgnoreLists.jsm
toolkit/modules/IndexedDB.jsm
toolkit/modules/InlineSpellChecker.jsm
toolkit/modules/InlineSpellCheckerContent.jsm
toolkit/modules/Integration.jsm
toolkit/modules/JSONFile.jsm
toolkit/modules/JsonSchema.jsm
toolkit/modules/KeywordUtils.jsm
toolkit/modules/LayoutUtils.jsm
toolkit/modules/LightweightThemeConsumer.jsm
toolkit/modules/Log.jsm
toolkit/modules/NLP.jsm
toolkit/modules/NewTabUtils.jsm
toolkit/modules/OSKeyStore.jsm
toolkit/modules/ObjectUtils.jsm
toolkit/modules/OsEnvironment.jsm
toolkit/modules/PageMenu.jsm
toolkit/modules/PermissionsUtils.jsm
toolkit/modules/PopupNotifications.jsm
toolkit/modules/Preferences.jsm
toolkit/modules/PrivateBrowsingUtils.jsm
toolkit/modules/ProcessType.jsm
toolkit/modules/ProfileAge.jsm
toolkit/modules/PromiseUtils.jsm
toolkit/modules/PropertyListUtils.jsm
toolkit/modules/Region.jsm
toolkit/modules/RemotePageAccessManager.jsm
toolkit/modules/ResetProfile.jsm
toolkit/modules/ResponsivenessMonitor.jsm
toolkit/modules/SelectionUtils.jsm
toolkit/modules/ServiceRequest.jsm
toolkit/modules/Services.jsm
toolkit/modules/ShortcutUtils.jsm
toolkit/modules/Sqlite.jsm
toolkit/modules/SubDialog.jsm
toolkit/modules/Timer.jsm
toolkit/modules/Troubleshoot.jsm
toolkit/modules/UpdateUtils.jsm
toolkit/modules/WebChannel.jsm
toolkit/modules/WindowsRegistry.jsm
toolkit/modules/sessionstore/PrivacyFilter.jsm
toolkit/modules/sessionstore/PrivacyLevel.jsm
toolkit/modules/sessionstore/SessionHistory.jsm
toolkit/modules/sessionstore/Utils.jsm
toolkit/modules/subprocess/Subprocess.jsm
toolkit/modules/tests/modules/MockDocument.jsm
toolkit/modules/tests/modules/OSKeyStoreTestUtils.jsm
toolkit/modules/tests/modules/PromiseTestUtils.jsm
toolkit/modules/tests/xpcshell/RegionTestUtils.jsm
toolkit/modules/tests/xpcshell/TestIntegration.jsm
toolkit/mozapps/downloads/DownloadLastDir.jsm
toolkit/mozapps/downloads/DownloadUtils.jsm
toolkit/mozapps/downloads/HelperAppDlg.jsm
toolkit/mozapps/extensions/AbuseReporter.jsm
toolkit/mozapps/extensions/AddonManager.jsm
toolkit/mozapps/extensions/Blocklist.jsm
toolkit/mozapps/extensions/LightweightThemeManager.jsm
toolkit/mozapps/extensions/amContentHandler.jsm
toolkit/mozapps/extensions/amInstallTrigger.jsm
toolkit/mozapps/extensions/amWebAPI.jsm
toolkit/mozapps/extensions/internal/AddonRepository.jsm
toolkit/mozapps/extensions/internal/AddonSettings.jsm
toolkit/mozapps/extensions/internal/AddonTestUtils.jsm
toolkit/mozapps/extensions/internal/AddonUpdateChecker.jsm
toolkit/mozapps/extensions/internal/GMPProvider.jsm
toolkit/mozapps/extensions/internal/ProductAddonChecker.jsm
toolkit/mozapps/extensions/internal/XPIDatabase.jsm
toolkit/mozapps/extensions/internal/XPIInstall.jsm
toolkit/mozapps/extensions/internal/XPIProvider.jsm
toolkit/mozapps/handling/ContentDispatchChooser.jsm
toolkit/mozapps/update/BackgroundTask_backgroundupdate.jsm
toolkit/mozapps/update/BackgroundUpdate.jsm
toolkit/mozapps/update/UpdateListener.jsm
toolkit/mozapps/update/UpdateService.jsm
toolkit/mozapps/update/UpdateServiceStub.jsm
toolkit/mozapps/update/UpdateTelemetry.jsm
uriloader/exthandler/HandlerList.jsm
uriloader/exthandler/WebHandlerApp.jsm
uriloader/exthandler/tests/HandlerServiceTestUtils.jsm
browser/components/distribution.js
browser/components/syncedtabs/SyncedTabsDeckComponent.js
browser/components/syncedtabs/SyncedTabsDeckStore.js
browser/components/syncedtabs/SyncedTabsDeckView.js
browser/components/syncedtabs/SyncedTabsListStore.js
browser/components/syncedtabs/TabListComponent.js
browser/components/syncedtabs/TabListView.js
browser/components/syncedtabs/util.js
remote/marionette/accessibility.js
remote/marionette/addon.js
remote/marionette/appinfo.js
remote/marionette/browser.js
remote/marionette/capture.js
remote/marionette/cert.js
remote/marionette/cookie.js
remote/marionette/dom.js
remote/marionette/driver.js
remote/marionette/element.js
remote/marionette/evaluate.js
remote/marionette/event.js
remote/marionette/interaction.js
remote/marionette/l10n.js
remote/marionette/legacyaction.js
remote/marionette/message.js
remote/marionette/modal.js
remote/marionette/navigate.js
remote/marionette/packets.js
remote/marionette/permissions.js
remote/marionette/prefs.js
remote/marionette/reftest.js
remote/marionette/server.js
remote/marionette/stream-utils.js
remote/marionette/sync.js
remote/marionette/transport.js
services/common/async.js
services/common/hawkclient.js
services/common/hawkrequest.js
services/common/kinto-storage-adapter.js
services/common/logmanager.js
services/common/modules-testing/logging.js
services/common/observers.js
services/common/rest.js
services/common/tokenserverclient.js
services/common/uptake-telemetry.js
services/common/utils.js
services/crypto/modules/WeaveCrypto.js
services/crypto/modules/utils.js
services/fxaccounts/FxAccountsCommands.js
services/fxaccounts/FxAccountsPairingChannel.js
services/settings/remote-settings.js
services/sync/modules-testing/fakeservices.js
services/sync/modules-testing/fxa_utils.js
services/sync/modules-testing/rotaryengine.js
services/sync/modules-testing/utils.js
services/sync/modules/addonsreconciler.js
services/sync/modules/addonutils.js
services/sync/modules/bookmark_validator.js
services/sync/modules/bridged_engine.js
services/sync/modules/collection_validator.js
services/sync/modules/doctor.js
services/sync/modules/engines.js
services/sync/modules/engines/addons.js
services/sync/modules/engines/bookmarks.js
services/sync/modules/engines/clients.js
services/sync/modules/engines/extension-storage.js
services/sync/modules/engines/forms.js
services/sync/modules/engines/history.js
services/sync/modules/engines/passwords.js
services/sync/modules/engines/prefs.js
services/sync/modules/engines/tabs.js
services/sync/modules/keys.js
services/sync/modules/main.js
services/sync/modules/policies.js
services/sync/modules/record.js
services/sync/modules/resource.js
services/sync/modules/service.js
services/sync/modules/stages/declined.js
services/sync/modules/stages/enginesync.js
services/sync/modules/status.js
services/sync/modules/sync_auth.js
services/sync/modules/telemetry.js
services/sync/modules/util.js
services/sync/tps/extensions/tps/resource/quit.js
toolkit/components/certviewer/content/certDecoder.jsm
toolkit/components/certviewer/content/vendor/asn1js_bundle.jsm
toolkit/components/certviewer/content/vendor/pkijs_bundle.jsm
toolkit/components/certviewer/content/vendor/pvutils_bundle.jsm
toolkit/components/normandy/actions/schemas/index.js
toolkit/components/passwordmgr/crypto-SDR.js
toolkit/components/passwordmgr/storage-geckoview.js
toolkit/components/passwordmgr/storage-json.js
toolkit/components/pdfjs/content/build/pdf.sandbox.external.js
toolkit/components/pdfjs/pdfjs.js
EOF
)

for FILE in ${FILES}; do
    python3 ../jsm-to-esm/rename.py ${FILE}
done

ESMS=$(
for FILE in ${FILES}; do
    ESM=$(echo ${FILE} \
              | sed -e "s/\.jsm$/.sys.mjs/" \
              | sed -e "s/\.jsm.js$/.sys.mjs/" \
              | sed -e "s/\.js$/.sys.mjs/")
    if ! [ -f ${ESM} ]; then
        continue
    fi
    echo ${ESM}
done
)

if [ "x${ESMS}" = "x" ]; then
   echo "No modules are converted"
   exit
fi

../jsm-to-esm/node_modules/.bin/jscodeshift \
    -t ../jsm-to-esm/exported_symbols-to-declarations.js ${ESMS}
../jsm-to-esm/node_modules/.bin/jscodeshift \
    -t ../jsm-to-esm/import-to-import_esmodule.js ${ESMS}
