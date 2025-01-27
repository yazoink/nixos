{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "paradise-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "paradise-icons";
    rev = "main";
    sha256 = "sha256-G/R8tBabEsxkD68pUYS3t+Tb8qyg6h1NFIt0QazV0Bo=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Papirus-Paradise-* $out/share/icons
  '';
}
