# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps.fileManager) command;
in
  lib.mkMerge [
    # nemo
    (lib.mkIf (command == "nemo")
      (import ./nemo {inherit osConfig config lib pkgs inputs;}))
    # pcmanfm
    (lib.mkIf (command == "pcmanfm")
      (import ./pcmanfm {inherit osConfig config lib pkgs inputs;}))
    # thunar
    (lib.mkIf (command == "thunar")
      (import ./thunar {inherit osConfig config lib pkgs inputs;}))
  ]
