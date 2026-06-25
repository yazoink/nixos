{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "everblush-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "everblush-icons";
    rev = "main";
    sha256 = "sha256-NYqAlTe4m2Kmpgc1NeQtR+J+LFk7ef8YjYe2Ivys9eI=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Everblush-Icons $out/share/icons
  '';
}
