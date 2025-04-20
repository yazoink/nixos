{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rosepine-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Rose-Pine-GTK-Theme";
    rev = "main";
    sha256 = "sha256-dFh5K0ipaESLeMIQTqDtJHVGrkUWGm0Hyfs39bJhk6o=";
  };

  dontUnpack = true;

  configurePhase = "";
  buildPhase = "";
  patchPhase = "";
  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/icons/* $out/share/icons
  '';
}
