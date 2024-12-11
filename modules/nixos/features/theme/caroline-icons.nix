{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-icons";
    rev = "cfd7503a729d72ad785229fc9a12c97285ddf440";
    sha256 = "sha256-z+lEZYVgRWc2Hv07K/UFK2/fOJPtWLd1m3P65UQSBr8=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/caroline-icons $out/share/icons
  '';
}
