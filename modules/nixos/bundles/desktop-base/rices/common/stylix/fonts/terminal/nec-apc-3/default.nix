{pkgs, ...}: {
  package = pkgs.callPackage ./nec-apc-3 {};
  name = "Bm437 NEC APC3 8x16";
}
