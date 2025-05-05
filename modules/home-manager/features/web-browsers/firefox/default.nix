{
  inputs,
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  imports = [
    ./theme
  ];

  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "firefox") {
    defaultApps.webBrowser.desktopFile = "firefox.desktop";
    stylix.targets.firefox = {
      enable = false;
      # enable = true;
      firefoxGnomeTheme.enable = true;
      profileNames = [osConfig.myOptions.userAccount.username];
    };
    home = {
      sessionVariables = {
        MOZ_USE_XINPUT2 = 1;
      };
    };

    programs.firefox = {
      enable = true;
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
      profiles."${osConfig.myOptions.userAccount.username}" = {
        isDefault = true;
        search = {
          order = ["4get" "ddg" "google" "Bookmarks" "History" "Tabs"];
          force = true;
          default = "4get";
          privateDefault = "4get";
          engines = {
            "4get" = {
              urls = [
                {
                  template = "https://4get.yazo.ink/web?s={searchTerms}";
                }
              ];
              definedAliases = ["@4g"];
            };
          };
        };
        # extensions.force = true;
        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux";
          [
            ublock-origin
            sponsorblock
            stylus
            violentmonkey
            localcdn
            clearurls
            #foxytab
            libredirect
            floccus
            control-panel-for-twitter
          ]
          ++ (
            if osConfig.myOptions.hardwareFeatures.h264ify.enable
            then [enhanced-h264ify]
            else []
          );
        extraConfig = builtins.readFile ./user.js;
        /*
          extraConfig = builtins.readFile (builtins.fetchurl {
          url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
          sha256 = "0vfn3s7q4gm939a5cim1jlrr8k0f5pm4kxxsv1d9bwvv10pmz7pn";
        });
        */
      };
    };
  };
}
