{pkgs, ...}: let
  pswdrs = pkgs.callPackage ./pswdrs.nix {};
in {
  home.file.".config/pswdrs/words.txt".source = ./words.txt;
  home.packages = [pswdrs];
}
