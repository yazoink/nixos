{
  policies = {
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
    };
    DisablePocket = true;
    DisableFirefoxAccounts = true;
    DisableAccounts = true;
    DisableFirefoxScreenshots = false;
    OverrideFirstRunPage = "";
    OverridePostUpdatePage = "";
    DontCheckDefaultBrowser = true;
    DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
    DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
    SearchBar = "unified"; # alternative: "separate"
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    BlockAboutConfig = false;
    BlockAboutAddons = false;
    BlockAboutProfiles = false;
    BlockAboutSupport = false;
    AppAutoUpdate = false;
    UserMessaging = {
      ExtensionRecommendations = false;
      SkipOnboarding = true;
    };
  };
}
