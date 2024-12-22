{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rosepine-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Rose-Pine-GTK-Theme";
    rev = "main";
    sha256 = "sha256-Rz36eFSH++OFkw7v3TjOwNI44foIdoAVILAWrr4szHQ=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/icons/Rose-Pine-Moon $out/share/icons
  '';
}
