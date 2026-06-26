{
  pkgs-stable,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  name = config.myOptions.defaultApps.fileManager;
in
  import (./. + "/${name}") {inherit pkgs-stable config lib pkgs inputs;}
