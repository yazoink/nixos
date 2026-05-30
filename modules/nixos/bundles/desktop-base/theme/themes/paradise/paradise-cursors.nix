{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "paradise-cursors";

  src = ./BreezeX-Paradise;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Paradise
    cp -r $src/* $out/share/icons/BreezeX-Paradise
  '';
}
