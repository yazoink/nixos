{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "clean";
  version = "1.0";
  src = ./clean;
  buildInputs = [pkgs.bash];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/clean
  '';
}
