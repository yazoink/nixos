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
  # (import ./hyprexpo.nix {inherit pkgs config inputs;})
  # (import ./hyprgrass.nix {
  #   inherit pkgs config osConfig inputs lib;
  # })
]
