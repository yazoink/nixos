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
  (import ./display-manager {inherit config osConfig lib pkgs;})
  (import ./swayidle {inherit config osConfig lib pkgs;})
  (import ./labwc {inherit config osConfig lib pkgs;})
  (import ./kanshi {inherit config osConfig lib pkgs;})
]
