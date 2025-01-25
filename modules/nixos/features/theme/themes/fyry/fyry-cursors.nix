{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "fyry-cursors";

  src = ./BreezeX-Fyry;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Fyry
    cp -r $src/* $out/share/icons/BreezeX-Fyry
  '';
}
