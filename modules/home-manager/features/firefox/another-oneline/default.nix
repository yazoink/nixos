{osConfig, lib, config, inputs, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "firefox" && osConfig.myOptions.desktopTheme.firefoxCss.anotherOneline.enable) {
    home.file = {
      ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/userChrome.css".source = ./userChrome.css;
    };
  };
}
