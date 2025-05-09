{
  lib,
  config,
  ...
}:
lib.mkMerge [
  (import ./plugins {inherit config lib;})
  (import ./general.nix)
  (import ./keymaps.nix {inherit config lib;})
]
