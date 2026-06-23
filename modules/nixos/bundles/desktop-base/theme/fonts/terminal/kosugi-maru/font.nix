{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "kosugi-maru";
  src = ./KosugiMaru-Regular.ttf;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc/kosugi-maru
    cp $src $out/share/fonts/misc/kosugi-maru
  '';
}
