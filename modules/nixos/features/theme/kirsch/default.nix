{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "kirsch-font";
  src = ./custom/kirsch.bdf;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc
    cp $src $out/share/fonts/misc/kirsch.bdf
  '';
}
