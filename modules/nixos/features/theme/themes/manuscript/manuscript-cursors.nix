{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "manuscript-cursors";

  src = ./Bibata-Manuscript;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/Bibata-Manuscript
    cp -r $src/* $out/share/icons/Bibata-Manuscript
  '';
}
