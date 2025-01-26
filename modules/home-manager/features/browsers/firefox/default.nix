# https://color.firefox.com/?theme=XQAAAAL_AgAAAAAAAABBKYhm849SCicxcUN7ViuG_ebZUZXOFqnmjhZm1VFQCfj9bl943WDccz_Akz8SdUz8TFDGjl_ZSYYSICc2Zbsikn4WogycX4Aie2e8UIx8D0-R1bJlWOnsaWYvvowcHXh2ADAwxi27AXVZyrKfixs7vGPbYXqVtT4SaXQv9ggsolbZNrStW3mxj6bVYfAAnSi3t5-i-43_qmD59hj83e3pcFhlZN5GBTm6_ERzrdCap3Aoog7iGO-nb4dUL1ay7q9-9rTNqKruawiWDvdR813n6v_PeVKseRW4sIC6j0rwvUs_fopDoztHJi5FdjnDgOMzD_It2eC81zKm_6vshk0omkie3-a6kFULzbqWzErFq81W96ldlvO6do-X2YLYsyTzWqTPXqZxX3XU0FkIl4kUwEBn_XlfO4f0uUOxpsJ0t7L8NY6m1AvjGjROm_9S138A
{
  inputs,
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  imports = [
    ./shyfox
    ./firefox-ui-fix
    ./another-oneline
    ./one-line-firefox
  ];

  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "firefox") {
    home = {
      sessionVariables = {
        MOZ_USE_XINPUT2 = 1;
      };
      # packages = with pkgs; [pywalfox-native];
      # file = {
      #   ".cache/wal/colors.json".text = with config.stylix.base16Scheme; ''
      #     {
      #       "wallpaper": "${config.stylix.image}",
      #       "alpha": "100",
      #       "colors": {
      #         "color0": "#${base00}",
      #         "color1": "#${base01}",
      #         "color2": "#${base02}",
      #         "color3": "#${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}",
      #         "color4": "#${base05}",
      #         "color5": "#${base05}",
      #         "color6": "#${base05}",
      #         "color7": "#${base05}",
      #         "color8": "#${base05}",
      #         "color9": "#${base05}",
      #         "color10": "#${base05}",
      #         "color11": "#${base05}",
      #         "color12": "#${base05}",
      #         "color13": "#${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}",
      #         "color14": "#${base05}",
      #         "color15": "#${base05}",
      #         "color16": "#${base05}",
      #         "color17": "#${base05}",
      #         "color18": "#${base05}",
      #         "color19": "#${base05}"
      #       }
      #     }
      #   '';
      # };
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
          order = ["4get" "DuckDuckGo" "Google" "Bookmarks" "History" "Tabs"];
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
        extensions = with inputs.firefox-addons.packages."x86_64-linux";
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
            firefox-color
            # pywalfox
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
