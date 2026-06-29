{pkgs, ...}: let
  kjtocal = pkgs.callPackage ./kjtocal.nix {};
in {
  home.packages = [kjtocal];
}
