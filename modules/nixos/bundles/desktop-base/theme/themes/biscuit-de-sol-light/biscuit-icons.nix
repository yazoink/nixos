{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "biscuit-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Biscuit-Theme";
    repo = "gtk";
    rev = "main";
    sha256 = "sha256-lEUqube0mvPLhN1prQ5IypspnJ244byu2IQSn6Vr8QE=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/papirus-biscuit-light $out/share/icons
  '';
}
