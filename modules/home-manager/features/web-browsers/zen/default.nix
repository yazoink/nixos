# https://color.firefox.com/?theme=XQAAAAL_AgAAAAAAAABBKYhm849SCicxcUN7ViuG_ebZUZXOFqnmjhZm1VFQCfj9bl943WDccz_Akz8SdUz8TFDGjl_ZSYYSICc2Zbsikn4WogycX4Aie2e8UIx8D0-R1bJlWOnsaWYvvowcHXh2ADAwxi27AXVZyrKfixs7vGPbYXqVtT4SaXQv9ggsolbZNrStW3mxj6bVYfAAnSi3t5-i-43_qmD59hj83e3pcFhlZN5GBTm6_ERzrdCap3Aoog7iGO-nb4dUL1ay7q9-9rTNqKruawiWDvdR813n6v_PeVKseRW4sIC6j0rwvUs_fopDoztHJi5FdjnDgOMzD_It2eC81zKm_6vshk0omkie3-a6kFULzbqWzErFq81W96ldlvO6do-X2YLYsyTzWqTPXqZxX3XU0FkIl4kUwEBn_XlfO4f0uUOxpsJ0t7L8NY6m1AvjGjROm_9S138A
{
  inputs,
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "zen") {
    defaultApps.webBrowser.desktopFile = "zen.desktop";
    home = {
      sessionVariables = {
        MOZ_USE_XINPUT2 = 1;
      };
    };
    stylix.targets.zen-browser.profileNames = ["main"];
    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [pkgs.firefoxpwa];
      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
      profiles.main = {
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          sponsorblock
          stylus
          violentmonkey
          localcdn
          #foxytab
          libredirect
          floccus
          control-panel-for-twitter
        ];
      };
    };
  };
}
