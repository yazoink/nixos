{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps) documentReader;
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
  makeCfg documentReader desktopFiles.${documentReader}
