{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps) discordClient;
  makeCfg = name:
    import (./. + "/${name}") {inherit osConfig config lib pkgs inputs;};
in
  makeCfg discordClient
