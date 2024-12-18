{pkgs, stdenv, ...}:
stdenv.mkDerivation {
  pname = "audtousd";
  version = "1.0";
  src = ./audtousd;
  buildInputs = [pkgs.python3 pkgs.python312Packages.beautifulsoup4 pkgs.python312Packages.requests];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/audtousd
  '';
}
