{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rosepine-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Rose-Pine-GTK-Theme";
    rev = "main";
    sha256 = "sha256-nEp9qHVfGMzO6QqkYk1NJ5FT+h0m/bnkrJUzAskNUac=";
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
