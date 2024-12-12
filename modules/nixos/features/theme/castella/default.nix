{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "castella-font";
  src = ./castella-14.bdf;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/misc
    cp $src $out/share/fonts/misc/castella-14.bdf
  '';
}
