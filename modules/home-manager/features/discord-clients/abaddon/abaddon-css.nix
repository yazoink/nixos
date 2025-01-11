{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "abaddon-css";
  src = ./style.css;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/abaddon/css
    cp $src $out/share/abaddon/css/style.css
  '';
}
