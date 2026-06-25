# common configs for labwc-glass theme
{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) labwc-glass;
in {
  config = lib.mkIf labwc-glass.enable (lib.mkMerge [
    /*
      {
      desktopTheme.rice.labwc.barColor = lib.mkIf (osConfig.myOptions.desktopTheme.colorscheme == "paradise") "101010";
    }
    */
    (import ./eww {inherit config osConfig lib pkgs;})
    (import ./hyprlock {inherit config osConfig lib pkgs;})
    (import ./swayosd {inherit config osConfig lib pkgs;})
    (import ./wofi {inherit config osConfig lib pkgs;})
    (import ./waybar {inherit config osConfig lib pkgs;})
    (import ./labwc {inherit config osConfig lib pkgs;})
    (import ./swaync {inherit config osConfig lib pkgs;})
  ]);
}
