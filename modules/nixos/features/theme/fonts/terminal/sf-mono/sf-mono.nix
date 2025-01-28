{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "sf-mono";
  src = pkgs.fetchFromGitHub {
    owner = "supercomputra";
    repo = "SF-Mono-Font";
    rev = "master";
    sha256 = "";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/sf-mono
    cp $src/* $out/share/fonts/misc/sf-mono
  '';
}
