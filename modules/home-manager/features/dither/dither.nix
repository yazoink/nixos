{stdenv, bash, imagemagick, ...}:
stdenv.mkDerivation {
  pname = "dither";
  version = "1.0";

  src = ./dither;

  buildInputs = [bash imagemagick];

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/dither
  '';
}
