{
  lib,
  config,
  osConfig,
  ...
}:
lib.mkMerge [
  (import ./media.nix {inherit lib config osConfig;})
  (import ./windows.nix)
  (import ./gestures.nix)
  (import ./workspaces.nix)
  (import ./applications.nix)
]
