# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps.terminal) command;
in
  lib.mkMerge [
    (lib.mkIf (command == "alacritty")
      (import ./alacritty {inherit osConfig config lib pkgs inputs;}))

    (lib.mkIf (command == "footclient" || command == "foot")
      (import ./foot {inherit osConfig config lib pkgs inputs;}))

    (lib.mkIf (command == "kitty")
      (import ./kitty {inherit osConfig config lib pkgs inputs;}))
  ]
