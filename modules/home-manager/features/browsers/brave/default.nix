{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "brave") {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
      ];
      dictionaries = [
        pkgs.hunspellDictsChromium.en_US
      ];
      commandLineArgs = [
        "--enable-features=UseOzonePlatform --ozone-platform=wayland"
        # "--disable-features=WebRtcAllowInputVolumeAdjustment"
      ];
      initialPrefs = {
        "https_only_mode_auto_enabled" = true;
        "privacy_guide" = {"viewed" = true;};
        "safebrowsing" = {
          "enabled" = false;
          "enhanced" = false;
        };
        "autofill" = {
          "credit_card_enabled" = false;
          # "profile_enabled" = false;
        };
        "search" = {"suggest_enabled" = false;};
        "browser" = {
          "clear_data" = {
            "cache" = false;
            "browsing_data" = false;
            "cookies" = false;
            "cookies_basic" = false;
            "download_history" = true;
            "form_data" = true;
            "time_period" = 4;
            "time_period_basic" = 4;
          };
          "has_seen_welcome_page" = true;
          "theme" = {"follows_system_colors" = true;};
        };
        "enable_do_not_track" = true;
        "https_only_mode_enabled" = true;
        "intl"."selected_languages" = "en-CA,en-US";
        "payments"."can_make_payment_enabled" = false;
      };
      extraOpts = {
        "BrowserSignin" = 0;
        "SyncDisabled" = true;
        "PasswordManagerEnabled" = false;
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = ["en-CA" "en-US"];

        "CloudReportingEnabled" = false;
        "SafeBrowsingEnabled" = false;
        "ReportSafeBrowsingData" = false;
        "AllowDinosaurEasterEgg" = false; # : (
        "AllowOutdatedPlugins" = true;
        "DefaultBrowserSettingEnabled" = false;
        "PromotionalTabsEnabled" = false;
        "MetricsReportingEnabled" = false;
        "PaymentMethodQueryEnabled" = false;
        "ShoppingListEnabled" = false;

        "AlwaysOpenPdfExternally" = true;
        "ShowHomeButton" = false;

        "AutofillAddressEnabled" = false;
        "AutofillCreditCardEnabled" = false;

        # voice assistant
        # "VoiceInteractionContextEnabled" = false;
        # "VoiceInteractionHotwordEnabled" = false;
        # "VoiceInteractionQuickAnswersEnabled" = false;
      };
      "defaultSearchProviderEnabled" = true;
      "defaultSearchProviderSearchURL" = "https://kagi.com/search?q={searchTerms}";
      "defaultSearchProviderSuggestURL" = "https://kagi.com/api/autosuggest?q={searchTerms}";
    };
  };
}
