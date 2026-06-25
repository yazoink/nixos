{pkgs, ...}: let
  pswdgen = pkgs.callPackage ./pswdgen.nix {};
in {
  home.packages = [pswdgen];
}
