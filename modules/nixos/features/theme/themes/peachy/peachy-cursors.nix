{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "peachy-cursors";

  src = ./BreezeX-Peachy;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Peachy
    cp -r $src/* $out/share/icons/BreezeX-Peachy
  '';
}
