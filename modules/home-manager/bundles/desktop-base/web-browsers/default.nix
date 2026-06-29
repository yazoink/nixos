{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  defaultApps,
  zenBrowser,
  ...
}: let
  name = defaultApps.webBrowser;
  makeCfg = name: desktopFile:
    lib.mkMerge [
      (import (./. + "/${name}") {inherit osConfig config lib pkgs inputs zenBrowser;})
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
    zen-twilight = "zen-twilight.desktop";
  };
in
  makeCfg name desktopFiles.${name}
