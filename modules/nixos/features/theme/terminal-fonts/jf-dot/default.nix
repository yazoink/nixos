{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "jf-dot";
  src = ./font;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/jf-dot
    cp $src/* $out/share/fonts/misc/jf-dot
  '';
}
