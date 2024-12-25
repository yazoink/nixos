{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "wizard-theme";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "wizard-theme";
    rev = "main";
    sha256 = "sha256-youGz8wxZYVBO84CUX/QLVP1HX58mIh+WIWrRFAG3uM=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/icons/* $out/share/icons
    cp -r $src/cursors/* $out/share/icons
  '';
}
