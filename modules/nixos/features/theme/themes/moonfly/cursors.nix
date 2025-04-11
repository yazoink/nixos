{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "moonfly-cursors";

  src = ./BreezeX-Moonfly;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Moonfly
    cp -r $src/* $out/share/icons/BreezeX-Moonfly
  '';
}
