{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-icons";
    rev = "4665fe1a26d1fdc333e223d66aa99b7ad7164aac";
    sha256 = "sha256-RzhihJwyA0dq/RJtWizLTyaNenXzEaAeOlTD66gvDFI=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/caroline-suru-aspromauros $out/share/icons
  '';
}
