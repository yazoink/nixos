# common configs for labwc desktops
{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  labwc,
  ...
}:
lib.mkMerge [
  (import ./display-manager {inherit config osConfig lib pkgs;})
  (import ./swayidle {inherit config osConfig lib pkgs;})
  (import ./labwc {inherit config osConfig lib pkgs;})
  (lib.mkIf labwc.kanshi.enable
    (import ./kanshi {inherit config osConfig lib pkgs;}))
]
