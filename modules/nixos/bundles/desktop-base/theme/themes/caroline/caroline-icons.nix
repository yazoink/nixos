{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-icons";
    rev = "51fd705bd82bf2da45d3a35937d9d329759184a7";
    sha256 = "sha256-RzhihJwyA0dq/RJtWizLTyaNenXzEaAeOlTD66gvDFI=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/caroline-suru-aspromauros $out/share/icons
  '';
}
