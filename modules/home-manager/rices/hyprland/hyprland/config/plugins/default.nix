{
  lib,
  pkgs,
  config,
  osConfig,
  inputs,
  ...
}:
lib.mkMerge [
  (import ./hyprbars.nix {inherit pkgs config osConfig inputs;})
  # (import ./borders-plus-plus.nix {inherit pkgs config osConfig inputs;})
  # (import ./hyprexpo.nix {inherit pkgs config inputs;})
]
