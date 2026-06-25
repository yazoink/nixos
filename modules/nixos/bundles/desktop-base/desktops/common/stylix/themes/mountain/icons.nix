{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "mountain-icons";

  src = pkgs.fetchFromGitHub {
    owner = "mountain-theme";
    repo = "icons";
    rev = "33375520de469426c15139510e8e030c601c4717";
    sha256 = "";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons/Mountain
    cp -r $src/icons/* $out/share/icons/Mountain
  '';
}
