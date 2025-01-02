{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "scripts";
  version = "1.0";
  src = ./scripts;
  buildInputs = [pkgs.zsh pkgs.bash pkgs.python3];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src/* $out/bin
  '';
}
