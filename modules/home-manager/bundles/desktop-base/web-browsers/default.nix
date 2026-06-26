{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  name = osConfig.myOptions.defaultApps.webBrowser;
  makeCfg = name: desktopFile:
    lib.mkMerge [
      (import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;})
      {
        xdg.mimeApps.defaultApplications = {
          "x-scheme-handler/https" = [desktopFile];
          "x-scheme-handler/http" = [desktopFile];
          "x-scheme-handler/ftp" = [desktopFile];
          "x-scheme-handler/mailto" = [desktopFile];
        };
      }
    ];
  desktopFiles = {
    brave = "brave.desktop";
    firefox = "firefox.desktop";
    librewolf = "librewolf.desktop";
    zen = "zen-twilight.desktop";
  };
in
  makeCfg name desktopFiles.${name}
