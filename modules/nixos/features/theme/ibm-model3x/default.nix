{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "ibm-model3x-font";
  src = ./otb;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/ibm-model3x
    cp $src/* $out/share/fonts/misc/ibm-model3x
  '';
}
