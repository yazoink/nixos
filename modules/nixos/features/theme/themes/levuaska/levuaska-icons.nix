{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "levuaska-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "levuaska-icons";
    rev = "main";
    sha256 = "sha256-+TOxr8yFEf1pVuWXb77NDebhNhIDsOzXm2b4l4ZMI8M=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Papirus-Levuaska $out/share/icons
  '';
}
