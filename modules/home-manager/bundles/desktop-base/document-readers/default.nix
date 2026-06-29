{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  defaultApps,
  ...
}: let
  name = defaultApps.documentReader;
  makeCfg = name: desktopFile:
    lib.mkMerge [
      (import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;})
      {
        xdg.mimeApps.defaultApplications = {
          "application/pdf" = [desktopFile];
          "image/vnd.djvu" = [desktopFile];
          "application/epub+zip" = [desktopFile];
        };
      }
    ];
  desktopFiles = {
    atril = "atril.desktop";
    zathura = "org.pwmt.zathura.desktop";
  };
in
  makeCfg name desktopFiles.${name}
