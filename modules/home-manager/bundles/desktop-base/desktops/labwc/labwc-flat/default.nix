# configs for labwc-flat theme
{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) labwc-flat;
in {
  config = lib.mkIf labwc-flat.enable (lib.mkMerge [
    (import ./eww {inherit config osConfig lib pkgs;})
    (import ./mako {inherit config osConfig lib pkgs;})
    (import ./hyprlock {inherit config osConfig lib pkgs;})
    (import ./swayosd {inherit config osConfig lib pkgs;})
    (import ./wofi {inherit config osConfig lib pkgs;})
    (import ./waybar {inherit config osConfig lib pkgs;})
    (import ./labwc {inherit config osConfig lib pkgs;})
  ]);
}
