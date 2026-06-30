# common configs for labwc desktops
{
  config,
  osConfig,
  lib,
  pkgs,
  labwc,
  ...
}:
lib.mkMerge [
  # common (all WMs)
  (import ../../common/stylix {inherit config osConfig lib pkgs;})

  # common (labwc)
  (import ../common/display-manager {inherit config osConfig lib pkgs;})
  (import ../common/kanshi {inherit config osConfig lib pkgs;})
  (import ../common/labwc {inherit config osConfig lib pkgs;})
  (import ../common/hypridle {inherit config osConfig lib pkgs;})
  (import ../common/eww {inherit config osConfig lib pkgs;})
  (import ../common/hyprlock {inherit config osConfig lib pkgs;})
  (import ../common/swayosd {inherit config osConfig lib pkgs;})
  (import ../common/wofi {inherit config osConfig lib pkgs;})
  (lib.mkIf labwc.kanshi.enable
    (import ../common/kanshi {inherit config osConfig lib pkgs;}))

  # theme specific
  (import ./eww {inherit config osConfig lib pkgs;})
  (import ./hyprlock {inherit config osConfig lib pkgs;})
  (import ./labwc {inherit config osConfig lib pkgs;})
  (import ./swaync {inherit config osConfig lib pkgs;})
  (import ./swayosd {inherit config osConfig lib pkgs;})
  (import ./waybar {inherit config osConfig lib pkgs;})
  (import ./wofi {inherit config osConfig lib pkgs;})
]
