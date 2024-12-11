{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "caroline-icons";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "caroline-icons";
    rev = "cfd7503a729d72ad785229fc9a12c97285ddf440";
    sha256 = "sha256-pmVMqBZFDTnItUVwRcx185RgZJUNFyrG4k4qNU3EM5c=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/caroline-suru-aspromauros $out/share/icons
  '';
}
