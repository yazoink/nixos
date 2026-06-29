{pkgs, ...}: let
  usdtoaud = pkgs.callPackage ./usdtoaud.nix {};
in {
  home.packages = [usdtoaud];
}
