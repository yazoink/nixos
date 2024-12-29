{osConfig, lib, config, inputs, ...}:
{
  config = lib.mkIf (config.bundles.desktopBase.firefox.enable && osConfig.myOptions.desktopTheme.firefoxCss.oneLineFirefox.enable) {
    home.file = {
      ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/userChrome.css".source = ./userChrome.css;
    };
    programs.firefox.profiles."${osConfig.myOptions.userAccount.username}".settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.compactmode.show" = true;
      "extensions.pocket.enabled" = false;
    };
  };
}
