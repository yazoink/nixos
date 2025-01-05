{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "biscuit-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Biscuit-Theme";
    repo = "gtk";
    rev = "main";
    sha256 = "";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/papirus-biscuit-dark $out/share/icons
  '';
}
