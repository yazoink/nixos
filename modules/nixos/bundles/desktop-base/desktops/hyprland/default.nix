# hyprland rices
{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  windowManager,
  ...
}: let
  # inherit (windowManager.labwc) style;
in
  lib.mkMerge [
    # common WM configs
    (import ../common/stylix {inherit pkgs-stable config lib pkgs inputs;})

    # common hyprland configs
    (import ./common {inherit pkgs-stable config lib pkgs inputs;})
  ]
