{pkgs, ...}: let
  screenshot = pkgs.callPackage ./screenshot.nix {};
in {
  home.packages = [screenshot pkgs.grim pkgs.slurp pkgs.libnotify];
}
