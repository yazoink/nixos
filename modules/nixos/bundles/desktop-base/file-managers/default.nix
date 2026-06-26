{
  pkgs-stable,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (config.myOptions.defaultApps) fileManager;
  makeCfg = name:
    import (./. + "/${name}") {inherit pkgs-stable config lib pkgs inputs;};
in
  makeCfg fileManager
