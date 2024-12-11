{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-sddm-theme";
    rev = "6c9846d0b777e7729f33332dad792502acb2cff3";
    sha256 = "sha256-ErP863eYIyY8s3QgVH6USVpzQlRykAOleiS45szcR1E=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -r $src/caroline $out/share/sddm/themes
    cp -r $src/caroline-small-resolution $out/share/sddm/themes
    cp -r $src/caroline-large-resolution $out/share/sddm/themes
  '';
}
