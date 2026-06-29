# common configs for labwc desktops
{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  # common (all WMs)
  (import ../../common/stylix {inherit config osConfig lib pkgs;})

  # common (labwc)
  (import ../common/display-manager {inherit config osConfig lib pkgs;})
  (import ../common/kanshi {inherit config osConfig lib pkgs;})
  (import ../common/scripts {inherit config osConfig lib pkgs;})
  (import ../common/swayidle {inherit config osConfig lib pkgs;})

  # theme specific
  (import ./eww {inherit config osConfig lib pkgs;})
  (import ./hyprlock {inherit config osConfig lib pkgs;})
  (import ./labwc {inherit config osConfig lib pkgs;})
  (import ./mako {inherit config osConfig lib pkgs;})
  (import ./swayosd {inherit config osConfig lib pkgs;})
  (import ./waybar {inherit config osConfig lib pkgs;})
  (import ./wofi {inherit config osConfig lib pkgs;})
]
