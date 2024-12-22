{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rosepine-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Rose-Pine-GTK-Theme";
    rev = "main";
    sha256 = "";
  };

  dontUnpack = true;

  configurePhase = "";
  patchPhase = "";
  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/icons/* $out/share/icons
  '';
}
