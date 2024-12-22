{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "tarot-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "tarot-icons";
    rev = "main";
    sha256 = "sha256-RzhihJwyA0dq/RJtWizLTyaNenXzEaAeOlTD66gvDFI=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Tarot-Icons $out/share/icons
  '';
}
