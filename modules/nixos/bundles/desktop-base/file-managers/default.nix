{
  pkgs-stable,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (config.myOptions.defaultApps) fileManager;
in
  import (./. + "/${fileManager}") {inherit pkgs-stable config lib pkgs inputs;}
