{
  lib,
  pkgs,
  ...
}: let
  # name = config.myOptions.defaultApps.fileManager;
  fileManager = "thunar";
in (import (./. + "/${fileManager}") {inherit lib pkgs;})
