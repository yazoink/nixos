{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "gabarito";
  src = ./gabarito;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/gabarito
    cp $src/* $out/share/fonts/misc/gabarito
  '';
}
