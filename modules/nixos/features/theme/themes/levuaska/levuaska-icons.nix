{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "levuaska-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "levuaska-icons";
    rev = "main";
    sha256 = "sha256-4j7HFqtSjNy406jTH+/L924Y0coyjs8/ALzNQss0LzY=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Papirus-Levuaska $out/share/icons
  '';
}
