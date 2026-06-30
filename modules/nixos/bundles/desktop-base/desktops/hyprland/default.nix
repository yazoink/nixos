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
  inherit (windowManager.labwc) style;
in
  lib.mkMerge [
    (import ../common/stylix {inherit pkgs-stable config lib pkgs inputs;})
    (import ./. "/${style}" {inherit pkgs-stable config lib pkgs inputs;})
  ]
