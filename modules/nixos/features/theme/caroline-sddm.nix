{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-sddm-theme";
    rev = "6c9846d0b777e7729f33332dad792502acb2cff3";
    sha256 = "sha256-z+lEZYVgRWc2Hv07K/UFK2/fOJPtWLd1m3P65UQSBr8=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -r $src/caroline $out/share/sddm/themes
    cp -r $src/caroline-small-resolution $out/share/sddm/themes
    cp -r $src/caroline-large-resolution $out/share/sddm/themes
  '';
}
