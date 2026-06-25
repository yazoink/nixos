# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps.guiTextEditor) command;
in
  lib.mkMerge [
    # pluma
    (lib.mkIf (command == "pluma")
      (import ./pluma {inherit osConfig config lib pkgs inputs;}))
  ]
