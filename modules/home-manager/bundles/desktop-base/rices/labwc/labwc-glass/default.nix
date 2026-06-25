# common configs for labwc desktops
{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (import ./eww {inherit config osConfig lib pkgs;})
  (import ./hyprlock {inherit config osConfig lib pkgs;})
  (import ./labwc {inherit config osConfig lib pkgs;})
  (import ./swaync {inherit config osConfig lib pkgs;})
  (import ./swayosd {inherit config osConfig lib pkgs;})
  (import ./waybar {inherit config osConfig lib pkgs;})
  (import ./wofi {inherit config osConfig lib pkgs;})
]
