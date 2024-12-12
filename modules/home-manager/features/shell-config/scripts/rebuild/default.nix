{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "rebuild";
  version = "1.0";
  src = ./rebuild.nix;
  buildInputs = [pkgs.bash];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/rebuild
  '';
}
