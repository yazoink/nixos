{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "everblush-cursors";

  src = ./BreezeX-Everblush;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Everblush
    cp -r $src/* $out/share/icons/BreezeX-Everblush
  '';
}
