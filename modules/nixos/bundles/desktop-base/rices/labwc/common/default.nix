{
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (import ./labwc {inherit pkgs;})
  (import ./hyprlock {})
]
