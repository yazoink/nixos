{
  lib,
  pkgs,
  config,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
in
  lib.mkMerge [(import (./. + "/${name}") {inherit lib pkgs;})]
