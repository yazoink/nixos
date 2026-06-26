{
  pkgs-stable,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (config.myOptions.defaultApps) terminal;
in
  import (./. + "/${terminal}") {inherit pkgs-stable config lib pkgs inputs;}
