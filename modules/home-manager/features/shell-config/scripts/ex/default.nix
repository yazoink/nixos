{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "ex";
  version = "1.0";
  src = ./ex;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/ex
  '';
}
