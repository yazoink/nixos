{stdenv, fetchFromGitHub, bash, ...}:
stdenv.mkDerivation {
  pname = "color-scripts";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "stark";
    repo = "Color-Scripts";
    rev = "master";
    sha256 = "sha256-7lwR9QINTMyJ+9joMeEjZvzSvSZXT2VUvxxs9pMZLx0=";
  };

  buildInputs = [bash];

  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/color-scripts/* /out/bin
  '';
}
