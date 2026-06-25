{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "paradise-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "paradise-icons";
    rev = "main";
    sha256 = "sha256-khFYLgJ+hxRSwEoAtTRhzxV2HgvkGC98wV8gUhar+70=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Papirus-Paradise-* $out/share/icons
  '';
}
