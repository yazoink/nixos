{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-icons";
    rev = "main";
    sha256 = "sha256-B2ZDHrhnZ8yJjFd7DXUZWlVyCnYcZ06plzeDzCkpEt8=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/caroline-papirus-blue $out/share/icons
  '';
}
