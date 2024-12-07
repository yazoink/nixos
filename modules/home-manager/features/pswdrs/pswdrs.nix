{ pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "pswdrs";
  version = "1.0";
  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "pswdrs";
    rev = "main";
    sha256 = "sha256-wV43NiGYpxuTY2OVQofx2w2IxzJDqKz6hwxBq21oEU0=";
  };
  cargoHash = "sha256-JCQbcQPLNxCfbDiRKa/mDaWAUEwDsm5g+yoEYHgaa3Y=";
  buildInputs = [];
  nativeBuildInputs = [];
}
