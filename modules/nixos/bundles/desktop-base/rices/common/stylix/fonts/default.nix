{
  pkgs,
  lib,
  monoFont,
  sansFont,
  ...
}:
lib.mkMerge [
  (import ./desktop {inherit pkgs sansFont;})
  (import ./terminal {inherit pkgs monoFont;})
]
