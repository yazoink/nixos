{
  osConfig,
  lib,
  config,
  ...
}: let
  userChrome = config.lib.stylix.colors {
    template = ./userChrome.css.mustache;
    extension = ".css";
  };
in {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "firefox") {
    home.file = {
      ".mozilla/firefox/${osConfig.myOptions.userAccount.username}/chrome/userChrome.css".source = userChrome;
    };
  };
}
