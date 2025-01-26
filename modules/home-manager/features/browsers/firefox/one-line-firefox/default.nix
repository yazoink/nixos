{
  osConfig,
  lib,
  config,
  inputs,
  ...
}: let
  userChromeFile = config.lib.stylix.colors {
    template = ./userChrome.css.mustache;
    extension = ".css";
  };
in {
  config =
    if (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "firefox" && osConfig.myOptions.desktopTheme.firefoxCss.oneLineFirefox.enable)
    then {
      home.file = {
        ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/userChrome.css".source = userChromeFile;
      };
      programs.firefox.profiles."${osConfig.myOptions.userAccount.username}".settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.compactmode.show" = true;
        "extensions.pocket.enabled" = false;
      };
    }
    else {};
}
