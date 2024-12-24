{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "jf-dot-kappa-20";
  src = ./font;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/jf-dot-kappa-20
    cp $src/* $out/share/fonts/misc/jf-dot-kappa-20
  '';
}
