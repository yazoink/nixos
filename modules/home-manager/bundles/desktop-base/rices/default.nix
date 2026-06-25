# window managers
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) labwc-flat labwc-glass hyprland-flat;
in
  lib.mkMerge [
    # common configs
    (import ./common {inherit osConfig config lib pkgs inputs;})

    # hyprland configs
    (lib.mkIf
      hyprland-flat.enable
      (import ./hyprland/hyprland-flat {inherit osConfig config lib pkgs inputs;}))

    # labwc configs
    (lib.mkIf
      (labwc-flat.enable || labwc-glass.enable)
      (import ./labwc/common {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf
      labwc-flat.enable
      (import ./labwc/labwc-flat {inherit osConfig config lib pkgs inputs;}))
    (lib.mkIf
      labwc-glass.enable
      (import ./labwc/labwc-glass {inherit osConfig config lib pkgs inputs;}))
  ]
