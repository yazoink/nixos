{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "ascii";
  version = "1.0";
  src = ./ascii;
  buildInputs = [pkgs.zsh];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/ascii
  '';
}
