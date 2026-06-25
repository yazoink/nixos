# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps.imageViewer) command;
in
  lib.mkMerge [
    # imv
    (lib.mkIf (command == "imv")
      (import ./imv {inherit osConfig config lib pkgs inputs;}))
    # ristretto
    (lib.mkIf (command == "ristretto")
      (import ./ristretto {inherit osConfig config lib pkgs inputs;}))
  ]
