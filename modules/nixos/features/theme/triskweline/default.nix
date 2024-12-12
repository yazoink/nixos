{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "triskweline-font";
  src = ./bdf;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/triskweline
    cp $src/* $out/share/fonts/misc/triskweline
  '';
}
