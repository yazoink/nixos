{
  lib,
  pkgs,
  ...
}: {
  options = lib.mkMerge [
    (import ./default2.nix {inherit lib pkgs;})
  ];
}
