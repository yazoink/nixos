{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rosepine-cursors";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "tarot-cursor";
    rev = "main";
    sha256 = "sha256-D6uWpm3YWexj1vn/NkGZA+kRiiZ+5i6Kri8YkaX51LA=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Bibata-Tarot $out/share/icons
  '';
}
