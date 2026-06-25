# common configs
{
  osConfig,
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
lib.mkMerge [
  (import ./stylix {inherit osConfig config lib pkgs inputs;})
]
