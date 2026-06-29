# desktop configs
{
  pkgs-stable,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (config.myOptions.bundles.desktopBase.desktop) windowManager;
in
  lib.mkMerge [
    # hyprland configs
    (
      lib.mkIf (windowManager.name == "hyprland")
      (import ./hyprland {inherit pkgs-stable config lib pkgs inputs windowManager;})
    )

    # labwc configs
    (
      lib.mkIf (windowManager.name == "labwc")
      (import ./labwc {inherit pkgs-stable config lib pkgs inputs windowManager;})
    )
  ]
