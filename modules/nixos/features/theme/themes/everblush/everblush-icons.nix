{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "everblush-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "everblush-icons";
    rev = "main";
    sha256 = "";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Everblush-Icons $out/share/icons
  '';
}
