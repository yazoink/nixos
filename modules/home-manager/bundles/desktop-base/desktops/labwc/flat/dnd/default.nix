{pkgs, ...}: let
  dnd = pkgs.callPackage ./dnd.nix {};
in {
  home.packages = [dnd pkgs.libnotify];
}
