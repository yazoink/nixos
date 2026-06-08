{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) hyprland;
in {
  config = lib.mkIf hyprland.enable (lib.mkMerge [
    (import ./hyprland {inherit pkgs inputs;})
    (import ./hyprlock {})
  ]);
}
