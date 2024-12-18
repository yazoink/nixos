{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "palette";
  version = "1.0";
  src = ./palette;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/palette
  '';
}
