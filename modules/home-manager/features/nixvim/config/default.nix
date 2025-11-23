{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkMerge [
  (import ./plugins {inherit config lib pkgs;})
  (import ./general.nix {inherit pkgs config lib;})
  (import ./keymaps.nix {inherit config lib;})
]
