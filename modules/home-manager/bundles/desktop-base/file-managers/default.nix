# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps) fileManager;
  makeCfg = {
    name,
    desktopFile,
    ...
  }:
    lib.mkMerge [
      (import (./. + "/${name}"))
      {
        xdg.mimeApps.defaultApplications = {
          "inode/directory" = [desktopFile]; # Directories
        };
      }
    ];
  fileManagers = [
    {
      name = "nemo";
      desktopFile = "nemo.desktop";
    }
    {
      name = "pcmanfm";
      desktopFile = "pcmanfm.desktop";
    }
    {
      name = "thunar";
      desktopFile = "thunar.desktop";
    }
  ];
in
  makeCfg (fileManagers.${fileManager})
/*
  lib.mkMerge [
  # nemo
  (let
    desktopFile = "nemo.desktop";
  in lib.mkIf (fileManager == "nemo") lib.mkMerge [
    (import ./nemo {inherit osConfig config lib pkgs inputs;})
  ])
  # pcmanfm
  (lib.mkIf (fileManager == "pcmanfm")
    (import ./pcmanfm {inherit osConfig config lib pkgs inputs;}))
  # thunar
  (lib.mkIf (fileManager == "thunar")
    (import ./thunar {inherit osConfig config lib pkgs inputs;}))
]
*/

