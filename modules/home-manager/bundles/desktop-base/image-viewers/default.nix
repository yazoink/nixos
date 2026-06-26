{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  name = osConfig.myOptions.defaultApps.imageViewer;
  makeCfg = name: desktopFile:
    lib.mkMerge [
      (import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;})
      {
        xdg.mimeApps.defaultApplications = {
          "image/bmp" = [desktopFile];
          "image/gif" = [desktopFile];
          "image/svg+xml" = [desktopFile];
          "image/tiff" = [desktopFile];
          "image/png" = [desktopFile];
          "image/jpeg" = [desktopFile];
          "image/jp2" = [desktopFile];
          "image/avif" = [desktopFile];
          "image/webp" = [desktopFile];
          "image/heif" = [desktopFile];
          "image/x-pixmap" = [desktopFile];
        };
      }
    ];
  desktopFiles = {
    imv = "imv-dir.desktop";
    ristretto = "org.xfce.ristretto.desktop";
  };
in
  makeCfg name desktopFiles.${name}
