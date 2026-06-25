{pkgs, ...}: {
  package = pkgs.callPackage ./font {};
  name = "Gabarito";
}
