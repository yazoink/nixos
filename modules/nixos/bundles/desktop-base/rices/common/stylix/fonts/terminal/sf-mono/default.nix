{pkgs, ...}: {
  package = pkgs.callPackage ./sf-mono.nix {};
  name = "SFMono";
}
