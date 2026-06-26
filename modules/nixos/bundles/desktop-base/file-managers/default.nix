{
  lib,
  pkgs,
  config,
  fileManager,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
in
  import (./. + "/${fileManager}") {inherit lib pkgs;}
