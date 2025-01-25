{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "levuaska-cursors";

  src = ./BreezeX-Levuaska;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Levuaska
    cp -r $src/* $out/share/icons/BreezeX-Levuaska
  '';
}
