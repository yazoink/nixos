{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "oneui4-icons";

  src = pkgs.fetchFromGitHub {
    owner = "end-4";
    repo = "OneUI4-Icons";
    rev = "main";
    sha256 = "sha256-RzhihJwyA0dq/RJtWizLTyaNenXzEaAeOlTD66gvDFI=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/OneUI-dark $out/share/icons
    cp -r $src/OneUI-light $out/share/icons
  '';
}
