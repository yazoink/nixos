{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "paradise-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "paradise-icons";
    rev = "main";
    sha256 = "sha256-O1X3tJnvq/FTJZzBw5Kh2hEiA3yKYe5+OStLzLI2KtQ=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Papirus-Paradise-* $out/share/icons
  '';
}
