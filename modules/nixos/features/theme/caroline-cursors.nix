{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-cursors";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-cursors";
    rev = "a6f347f4b9fdb6187e357bb7eec3a9b3d36a917b";
    sha256 = "sha256-z+lEZYVgRWc2Hv07K/UFK2/fOJPtWLd1m3P65UQSBr8=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/caroline-bibata-modern $out/share/icons
    cp -r $src/caroline-bibata-original $out/share/icons
  '';
}
