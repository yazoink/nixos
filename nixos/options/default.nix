{
  lib,
  pkgs,
  ...
}: {
  options = lib.mkMergedOptionModule [
    (import ./default2.nix {inherit lib pkgs;})
  ];
}
