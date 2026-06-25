{pkgs, ...}: let
  audtousd = pkgs.callPackage ./audtousd.nix {};
in {
  home.packages = [audtousd];
}
