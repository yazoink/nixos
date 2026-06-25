# common configs
{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
lib.mkMerge [
  (import ./stylix {inherit config lib pkgs inputs;})
]
