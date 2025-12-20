{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (config.myOptions.desktopTheme.rice) interzone;
in {
  config = lib.mkMerge [
    (
      lib.mkIf interzone.enable
      (import ./hyprland {inherit pkgs inputs;})
      (import ./hyprlock)
    )
  ];
}
