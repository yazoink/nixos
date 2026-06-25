{
  inputs,
  lib,
  osConfig,
  config,
  ...
}: let
  inherit (osConfig.myOptions) bundles defaultApps;
  desktopFile = "firefox.desktop";
in {
  home = {
    sessionVariables = {
      MOZ_USE_XINPUT2 = 1;
    };
  };
  programs.firefox = lib.mkMerge [
    {enable = true;}
    (import ./config {inherit lib osConfig inputs;})
  ];
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/https" = [desktopFile];
    "x-scheme-handler/http" = [desktopFile];
    "x-scheme-handler/ftp" = [desktopFile];
    "x-scheme-handler/mailto" = [desktopFile];
  };
}
