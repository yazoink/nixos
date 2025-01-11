{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  src = ./style.css;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/abaddon/css
    cp $src $out/share/abaddon/css/style.css
  '';
}
