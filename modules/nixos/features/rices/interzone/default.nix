{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (config.myOptions.desktopBase.rice) interzone;
in {
  config = lib.mkIf interzone.enable lib.mkMerge [
    (import ./hyprland {inherit pkgs inputs;})
    (import ./hyprlock)
  ];
}
