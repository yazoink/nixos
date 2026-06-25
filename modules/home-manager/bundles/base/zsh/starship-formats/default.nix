{
  osConfig,
  lib,
  ...
}: let
  inherit (osConfig.myOptions.bundles.base) starshipFormat;
in
  lib.mkMerge [
    (lib.mkIf (starshipFormat == 1)
      (import ./1.nix))
    (lib.mkIf (starshipFormat == 2)
      (import ./2.nix))
    (lib.mkIf (starshipFormat == 3)
      (import ./3.nix))
  ]
