{
  lib,
  pkgs,
  config,
  ...
}: let
  name = builtins.trace "${config.myOptions.defaultApps.fileManager}" config.myOptions.defaultApps.fileManager;
in
  import (./. + "/${name}") {inherit lib pkgs;}
