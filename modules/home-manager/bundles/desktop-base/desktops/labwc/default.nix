{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) labwc;
in {
  config = lib.mkIf labwc.enable (lib.mkMerge [
    (import ./display-manager {inherit config osConfig lib pkgs;})
    (import ./eww {inherit config osConfig lib pkgs;})
    (import ./mako {inherit config osConfig lib pkgs;}) # either fnott or mako
    (import ./swayidle {inherit config osConfig lib pkgs;})
    (import ./hyprlock {inherit config osConfig lib pkgs;})
    (import ./swayosd {inherit config osConfig lib pkgs;})
    (import ./walker {inherit config osConfig lib pkgs;})
    (import ./waybar {inherit config osConfig lib pkgs;})
    (import ./labwc {inherit config osConfig lib pkgs;})
  ]);
}
