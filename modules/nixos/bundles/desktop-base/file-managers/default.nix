{
  lib,
  pkgs,
  fileManager,
  ...
}: let
  # name = config.myOptions.defaultApps.fileManager;
  # name = "thunar";
  name = fileManager;
in
  lib.mkMerge [
    (import (./. + "/${name}") {inherit lib pkgs;})
  ]
