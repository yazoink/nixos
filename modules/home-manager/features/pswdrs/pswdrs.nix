{ pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "pswdrs";
  version = "1.0";
  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "pswdrs";
    rev = "main";
    sha256 = "sha256-JCQbcQPLNxCfbDiRKa/mDaWAUEwDsm5g+yoEYHgaa3Y=";
  };
  cargoHash = "sha256-JCQbcQPLNxCfbDiRKa/mDaWAUEwDsm5g+yoEYHgaa3Y=";
  buildInputs = [];
  nativeBuildInputs = [];
}
