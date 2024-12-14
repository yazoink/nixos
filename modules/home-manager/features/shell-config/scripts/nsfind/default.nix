{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "nsfind";
  version = "1.0";
  src = ./nsfind;
  buildInputs = [pkgs.bash pkgs.fzf pkgs.yazi];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/nsfind
  '';
}
