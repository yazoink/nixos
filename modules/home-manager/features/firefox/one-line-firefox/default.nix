{osConfig, lib, config, inputs, ...}:
{
  config = if (osConfig.myOptions.bundles.desktopBase.enable && (osConfig.myOptions.defaultApps.webBrowser.command == "firefox") && osConfig.myOptions.desktopTheme.firefoxCss.shyfox.enable) then {
    home.file = {
      ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/userChrome.css".source = ./userChrome.css;
    };
    programs.firefox.profiles."${osConfig.myOptions.userAccount.username}".settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.compactmode.show" = true;
      "extensions.pocket.enabled" = false;
    };
  } else {};
}
