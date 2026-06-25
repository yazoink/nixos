{pkgs, ...}: {
  package = pkgs.callPackage ./product-sans {};
  name = "Product Sans";
}
