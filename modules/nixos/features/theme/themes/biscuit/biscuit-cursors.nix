{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "biscuit-cursors";

  src = ./BreezeX-Biscuit;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Biscuit
    cp -r $src/* $out/share/icons/BreezeX-Biscuit
  '';
}
