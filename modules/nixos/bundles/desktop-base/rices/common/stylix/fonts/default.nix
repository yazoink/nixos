{
  pkgs,
  lib,
  ...
}:
lib.mkMerge [
  (import ./desktop {inherit pkgs;})
  (import ./terminal {inherit pkgs;})
]
