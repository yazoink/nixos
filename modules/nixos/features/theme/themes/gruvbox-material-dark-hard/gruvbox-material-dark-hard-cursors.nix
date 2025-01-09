{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "gruvbox-dark-hard-cursors";

  src = ./BreezeX-Gruvbox-Dark-Hard;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Gruvbox-Dark-Hard
    cp -r $src/* $out/share/icons/BreezeX-Gruvbox-Dark-Hard
  '';
}
