{stdenv, bash, imagemagick, coreutils, ...}:
stdenv.mkDerivation {
  pname = "dither";
  version = "1.0";

  src = ./dither;

  nativeBuildInputs = [bash imagemagick coreutils];

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/dither
  '';
}
