{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rose-pine-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Rose-Pine-GTK-Theme";
    rev = "main";
    sha256 = "sha256-eeBuGvJKdv/puMg2FN3Ue52OU1LgipEte/OhRwIDDs8=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/icons/Rose-Pine $out/share/icons
  '';
}
