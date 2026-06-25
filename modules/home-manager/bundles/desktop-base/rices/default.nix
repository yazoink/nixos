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
    (import ./hyprland {inherit osConfig config lib pkgs inputs;})

    # labwc configs
    (import ./labwc {inherit osConfig config lib pkgs inputs;})
  ]
