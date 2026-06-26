{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  name = osConfig.myOptions.defaultApps.fileManager;
  makeCfg = name: desktopFile:
    lib.mkMerge [
      (import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;})
      {
        xdg.mimeApps.defaultApplications = {
          "inode/directory" = [desktopFile]; # Directories
        };
      }
    ];
  desktopFiles = {
    nemo = "nemo.desktop";
    pcmanfm = "pcmanfm.desktop";
    thunar = "thunar.desktop";
  };
in
  makeCfg name desktopFiles.${name}
