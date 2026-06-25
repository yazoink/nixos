{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-cursors";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-cursors";
    rev = "a6f347f4b9fdb6187e357bb7eec3a9b3d36a917b";
    sha256 = "sha256-sEKxLyhLfUXacIdEE4PjAwyPKYqJU43/vzXGPIAdlPw=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/caroline-bibata-modern $out/share/icons
    cp -r $src/caroline-bibata-original $out/share/icons
  '';
}
