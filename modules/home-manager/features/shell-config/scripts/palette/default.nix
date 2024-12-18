{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "palette";
  version = "1.0";
  src = ./palette;
  buildInputs = [pkgs.sh];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/palette
  '';
}
