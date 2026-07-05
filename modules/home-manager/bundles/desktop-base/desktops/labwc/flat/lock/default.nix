{pkgs, ...}: let
  lock = pkgs.callPackage ./lock.nix {};
in {
  home.packages = [lock];
}
