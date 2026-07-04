{pkgs, ...}: let
  color = pkgs.callPackage ./color.nix {};
in {
  home.packages = [color pkgs.hyprpicker];
}
