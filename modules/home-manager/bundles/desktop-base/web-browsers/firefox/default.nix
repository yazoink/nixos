{
  inputs,
  lib,
  osConfig,
  config,
  ...
}: let
  inherit (osConfig.myOptions) bundles defaultApps;
in {
  config = lib.mkIf (bundles.desktopBase.enable && defaultApps.webBrowser.command == "firefox") {
    defaultApps.webBrowser.desktopFile = "firefox.desktop";
    home = {
      sessionVariables = {
        MOZ_USE_XINPUT2 = 1;
      };
    };
    programs.firefox = lib.mkMerge [
      {enable = true;}
      (import ./config {inherit lib osConfig inputs;})
    ];
  };
}
