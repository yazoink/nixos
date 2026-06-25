{pkgs, ...}: let
  lyricli = pkgs.callPackage ./lyricli.nix {};
in {
  home.packages = [
    lyricli
  ];
}
