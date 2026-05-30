{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "sf-pro-display";
  src = ./fonts;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/sf-pro-display
    cp $src/* $out/share/fonts/misc/sf-pro-display
  '';
}
