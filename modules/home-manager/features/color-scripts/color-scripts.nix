{stdenv, fetchFromGitHub, bash, ...}:
stdenv.mkDerivation {
  pname = "color-scripts";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "stark";
    repo = "Color-Scripts";
    rev = "main";
    sha256 = "sha256-JCQbcQPLNxCfbDiRKa/mDaWAUEwDsm5g+yoEYHgaa3Y=";
  };

  buildInputs = [bash];

  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/color-scripts/* /out/bin
  '';
}