# common configs for labwc desktops
{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}:
lib.mkMerge [
  (import ./stylix {inherit config osConfig lib pkgs;})
]
