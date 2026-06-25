{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice.hyprland-flat) enable;
in {
  config = lib.mkIf enable (lib.mkMerge [
    (import ./display-manager {inherit config osConfig lib pkgs;})
    (import ./eww {inherit config osConfig lib pkgs;})
    (import ./mako {inherit config osConfig lib pkgs;}) # either fnott or mako
    # (import ./hypridle {inherit config osConfig lib pkgs;}) # using common swayidle conf
    (import ./hyprlock {inherit config osConfig lib pkgs;})
    (import ./hyprland {inherit config osConfig lib pkgs inputs;})
    (import ./swayosd {inherit config osConfig lib pkgs;})
    (import ./walker {inherit config osConfig lib pkgs;})
    (import ./waybar {inherit config osConfig lib pkgs;})
  ]);
}
