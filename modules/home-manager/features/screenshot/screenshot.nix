{stdenv, bash, ...}:
stdenv.mkDerivation {
  pname = "screenshot";
  version = "1.0";

  src = ./screenshot;

  buildInputs = [bash];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin
  '';
}
