{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-sddm-theme";
    rev = "main";
    sha256 = "sha256-vFhsTBjzaF2D3sdADMq6nDpQ5JGxaf56Stw+AQymMig=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -r $src/caroline $out/share/sddm/themes
    cp -r $src/caroline-small-resolution $out/share/sddm/themes
    cp -r $src/caroline-large-resolution $out/share/sddm/themes
  '';
}
