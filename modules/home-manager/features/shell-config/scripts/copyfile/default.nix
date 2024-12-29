{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "copyfile";
  version = "1.0";
  src = ./copyfile;
  buildInputs = [pkgs.bash];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/copyfile
  '';
}
