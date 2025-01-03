{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rosepine-cursors";

  src = ./Bibata-Rose-Pine;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/Bibata-Rose-Pine
    cp -r $src/* $out/share/icons/Bibata-Rose-Pine
  '';
}
