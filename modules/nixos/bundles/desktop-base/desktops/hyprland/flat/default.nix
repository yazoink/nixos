{
  lib,
  pkgs,
  inputs,
  ...
}:
lib.mkMerge [
  (import ./hyprland {inherit pkgs inputs;})
  (import ./hyprlock {})
]
