# https://color.firefox.com/?theme=XQAAAAJYAgAAAAAAAABBKYhm849SCicxcUF-LXcGHf3p79EhVPWc07va6AgP3IA9THaAdrddvk_9TsDbquoO7joJkG4nQZDC-Z-1sgMyDGh5RRNNa_mFlPaOOTQOWQfGZh0KTyYqzZQv6zM5rgUH7Y9C9OkpF-e4J0OMBrjk39Wsr4L8oEHFaEN58_oyF8JQIZvHlxNSIMYG2alq6v3wFxDX6SgDeydCoQ4e6zQueQFDBN2wag6jHRM9mTcl3hUKs5QipCscB1i7h-0MDZzT8clMrcaGETdoWJTPE-NzdQrPhEDwh_uHalD7GLhKqUowlJhDx976Dn6CA53tjJGkdC9vSYkn8_59Lw3L_5JmY0qQFh17b8QxZtEdj3vyiHB_4k1spG0SS4WhYk9MWYPny_VMxoJU8f19Tzk
{inputs, config, lib, osConfig, ...}:
{
  options = {
    bundles.desktopFull.firefox.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.firefox.enable {
    home = {
      sessionVariables = {
        MOZ_USE_XINPUT2 = 1;
      };
      file.".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome" = {
        source = ./chrome;
        recursive = true;
      };
    };

    programs.firefox = {
      enable = true;
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
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
          order = ["4get" "DuckDuckGo" "Google" "Bookmarks" "History" "Tabs"];
          force = true;
          default = "4get";
          privateDefault = "4get";
          engines = {
            "4get" = {
              urls = [{
                template = "https://4get.yazo.ink/web?s={searchTerms}";
              }];
              definedAliases = [ "@4g" ];
            };
          };
        };
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          sponsorblock
          stylus
          violentmonkey
          localcdn
          clearurls
          #foxytab
          libredirect
          floccus
          firefox-color
          control-panel-for-twitter
          sidebery
          userchrome-toggle-extended
        ] ++ (if osConfig.networking.hostName == "cyberia" then [enhanced-h264ify] else []);
        extraConfig = builtins.readFile ./betterfox.js;
        /*extraConfig = builtins.readFile (builtins.fetchurl {
          url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
          sha256 = "0vfn3s7q4gm939a5cim1jlrr8k0f5pm4kxxsv1d9bwvv10pmz7pn";
        });*/
      };
    };
  };
}
