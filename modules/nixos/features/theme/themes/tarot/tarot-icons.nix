{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "tarot-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "tarot-icons";
    rev = "main";
    sha256 = "sha256-Rz36eFSH++OFkw7v3TjOwNI44foIdoAVILAWrr4szHQ=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Tarot-Icons $out/share/icons
  '';
}
