{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "sf-mono";
  src = pkgs.fetchFromGitHub {
    owner = "supercomputra";
    repo = "SF-Mono-Font";
    rev = "master";
    sha256 = "sha256-3wG3M4Qep7MYjktzX9u8d0iDWa17FSXYnObSoTG2I/o=";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/sf-mono
    cp $src/* $out/share/fonts/misc/sf-mono
  '';
}
