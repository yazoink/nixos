{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "wizard-theme";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "wizard-theme";
    rev = "main";
    sha256 = "sha256-LGLLQsF4sUGsg99eX0osfYMJzDKabw3WZFYugUu5XIk=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/icons/* $out/share/icons
    cp -r $src/cursors/* $out/share/icons
  '';
}
