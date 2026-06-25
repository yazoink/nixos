# stylix theming
{
  osConfig,
  pkgs,
  lib,
  config,
  ...
}:
lib.mkMerge [
  (import ./gtk {inherit config osConfig lib;})
  (import ./qt {inherit config pkgs osConfig lib;})

  (import ./imv {inherit config pkgs osConfig lib;})
  (import ./kitty {inherit config pkgs osConfig lib;})
  (import ./firefox {inherit config pkgs osConfig lib;})
  (import ./zen {inherit config pkgs osConfig lib;})
  (import ./vim {inherit config pkgs osConfig lib;})
  (import ./cava {inherit config pkgs osConfig lib;})
  (import ./vesktop {inherit config pkgs osConfig lib;})
  (import ./lutgen {inherit config pkgs osConfig lib;})
]
