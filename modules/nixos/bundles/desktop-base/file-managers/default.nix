{
  lib,
  pkgs,
  config,
  fileManager,
  ...
}: let
  # name = config.myOptions.defaultApps.fileManager;
  name = "thunar";
in
  lib.mkMerge [
    (import (./. + "/${fileManager}") {inherit lib pkgs;})
  ]
