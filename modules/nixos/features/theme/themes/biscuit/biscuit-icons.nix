{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "biscuit-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "biscuit-icons";
    rev = "main";
    sha256 = "sha256-RzhihJwyA0dq/RJtWizLTyaNenXzEaAeOlTD66gvDFI=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/papirus-biscuit-dark $out/share/icons
  '';
}
