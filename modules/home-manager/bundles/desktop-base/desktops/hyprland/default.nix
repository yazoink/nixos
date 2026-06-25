# hyprland configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) hyprland-flat;
in
  lib.mkMerge [
    # flat
    (lib.mkIf hyprland-flat.enable
      (import ./flat {inherit osConfig config lib pkgs inputs;}))
  ]
