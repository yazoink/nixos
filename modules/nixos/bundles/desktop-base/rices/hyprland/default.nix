# hyprland rices
{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) hyprland-flat;
in
  lib.mkMerge [
    (lib.mkIf hyprland-flat.enable
      (import ./common {inherit pkgs-stable config lib pkgs inputs;}))
  ]
