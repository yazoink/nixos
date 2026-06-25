# hyprland rices
{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) labwc-flat labwc-glass;
in
  lib.mkMerge [
    # common labwc configs
    (lib.mkIf (labwc-flat.enable || labwc-glass.enable)
      (import ./common {inherit pkgs-stable config lib pkgs inputs;}))
  ]
