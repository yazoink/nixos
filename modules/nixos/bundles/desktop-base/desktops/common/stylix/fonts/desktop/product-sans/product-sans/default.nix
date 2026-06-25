{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "product-sans";
  src = ./font;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/product-sans
    cp $src/* $out/share/fonts/misc/product-sans
  '';
}
