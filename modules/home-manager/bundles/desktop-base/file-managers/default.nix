{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps) fileManager;
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
  makeCfg fileManager desktopFiles.${fileManager}
