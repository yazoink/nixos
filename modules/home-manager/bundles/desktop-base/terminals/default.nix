{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps) terminal;
  makeCfg = name:
    import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;};
in
  makeCfg terminal
