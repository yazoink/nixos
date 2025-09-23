{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkMerge [
  (import ./plugins {inherit config lib pkgs;})
  (import ./general.nix)
  (import ./keymaps.nix {inherit config lib;})
]
