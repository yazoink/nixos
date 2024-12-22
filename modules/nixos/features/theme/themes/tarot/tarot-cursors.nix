{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-cursors";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "tarot-cursor";
    rev = "main";
    sha256 = "sha256-sEKxLyhLfUXacIdEE4PjAwyPKYqJU43/vzXGPIAdlPw=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/Bibata-Tarot $out/share/icons
  '';
}
