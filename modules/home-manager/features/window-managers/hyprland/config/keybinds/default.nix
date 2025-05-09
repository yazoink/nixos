{
  lib,
  config,
  ...
}:
lib.mkMerge [
  (import ./media.nix {inherit lib config;})
  (import ./windows.nix)
  (import ./gestures.nix)
  (import ./workspaces.nix)
  (import ./applications.nix)
]
