{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
lib.mkMerge [
  (import ./stylix {inherit lib config pkgs inputs;})
]
