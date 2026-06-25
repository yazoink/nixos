{pkgs, ...}: {
  package = pkgs.callPackage ./font.nix {};
  name = "Kosugi Maru";
}
