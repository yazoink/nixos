# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps.discordClient) command;
in
  lib.mkMerge [
    (lib.mkIf (command == "vesktop")
      (import ./vesktop {inherit osConfig config lib pkgs inputs;}))
  ]
