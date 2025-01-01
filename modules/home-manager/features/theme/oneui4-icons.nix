{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "oneui4-icons";

  src = pkgs.fetchFromGitHub {
    owner = "end-4";
    repo = "OneUI4-Icons";
    rev = "main";
    sha256 = "";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/OneUI-dark $out/share/icons
    cp -r $src/OneUI-light $out/share/icons
  '';
}
