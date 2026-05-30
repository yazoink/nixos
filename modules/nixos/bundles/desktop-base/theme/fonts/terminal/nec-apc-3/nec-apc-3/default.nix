{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "nec-apc-3-font";
  src = ./Bm437_NEC_APC3_8x16.otb;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc
    cp $src $out/share/fonts/misc/Bm437_NEC_APC3_8x16.otb
  '';
}
