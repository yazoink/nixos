{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "dict";
  version = "1.0";
  src = ./dict;
  buildInputs = [pkgs.bash pkgs.jq pkgs.curl];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/dict
  '';
}
