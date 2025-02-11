{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "levuaska-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "levuaska-icons";
    rev = "main";
    sha256 = "sha256-yFKgjFHxCAYR3fpn+6W8g2VPN2slAPCn5OWlCixxrbU=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Papirus-Levuaska $out/share/icons
  '';
}
