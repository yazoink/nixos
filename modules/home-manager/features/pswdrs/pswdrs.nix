{ pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "pswdrs";
  version = "1.0";
  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "pswdrs";
    rev = "main";
    sha256 = "sha256-tkJL3365pKOXPt7o6Z7JqdUFqHPKaSinfRpXh0X06DM=";
  };
  cargoHash = "sha256-3cdwL9ocrSybseg15Bsg4GdE96tvMbilDnpQHRJ+z0c=";
  buildInputs = [];
  nativeBuildInputs = [];
  /*postInstall = ''
    mkdir -p $out/share/pswdrs
    cp -r $src/data/* $out/share/pswdrs
  '';*/
}
