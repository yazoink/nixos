{
  lib,
  pkgs,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
  fileManager = "thunar";
in (import (./. + "/${name}") {inherit lib pkgs;})
