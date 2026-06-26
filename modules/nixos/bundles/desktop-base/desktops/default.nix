# desktop configs
{
  pkgs-stable,
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
lib.mkMerge [
  # common configs
  (import ./common {inherit pkgs-stable config lib pkgs inputs;})

  # hyprland configs
  (import ./hyprland {inherit pkgs-stable config lib pkgs inputs;})

  # labwc configs
  (import ./labwc {inherit pkgs-stable config lib pkgs inputs;})
]
