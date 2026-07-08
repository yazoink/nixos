{pkgs, ...}: let
  yzshell = pkgs.callPackage ./yzshell.nix {};
in {
  home.packages = [yzshell];
}
