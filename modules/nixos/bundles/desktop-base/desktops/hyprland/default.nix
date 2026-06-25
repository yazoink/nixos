{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) hyprland-flat;
in {
  config = lib.mkIf hyprland-flat.enable (lib.mkMerge [
    (import ./hyprland {inherit pkgs inputs;})
    (import ./hyprlock {})
  ]);
}
