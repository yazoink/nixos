{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rose-pine-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Rose-Pine-GTK-Theme";
    rev = "main";
    sha256 = "";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/icons/RoséPine-Moon $out/share/icons
  '';
}
