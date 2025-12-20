{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) interzone;
in {
  config = lib.mkIf interzone.enable (lib.mkMerge [
    (import ./display-manager {inherit config osConfig lib pkgs;})
    (import ./eww {inherit config osConfig lib pkgs;})
    (import ./fnott {inherit config osConfig lib pkgs;})
    (import ./hypridle {inherit config osConfig lib pkgs;})
    (import ./hyprland {inherit config osConfig lib pkgs inputs;})
    (import ./swayosd {inherit config osConfig lib pkgs;})
    (import ./walker {inherit config osConfig lib pkgs;})
    (import ./waybar {inherit config osConfig lib pkgs;})
  ]);
}
