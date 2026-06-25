{pkgs, ...}: {
  package = pkgs.callPackage ./sf-pro-display {};
  name = "SF Pro Display";
}
