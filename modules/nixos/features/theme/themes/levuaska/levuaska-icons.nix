{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "levuaska-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "levuaska-icons";
    rev = "main";
    sha256 = "";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Papirus-Levuaska $out/share/icons
  '';
}
