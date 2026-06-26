{
  lib,
  pkgs,
  config,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
in
  import (./. + "/${name}") {inherit lib pkgs;}
