{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) interzone;
in {
  config = lib.mkIf interzone.enable (lib.mkMerge [
    (import ./hyprland {inherit pkgs inputs;})
    (import ./hyprlock {})
  ]);
}
