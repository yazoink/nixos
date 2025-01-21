{ pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-tkJL3365pKOXPt7o6Z7JqdUFqHPKaSinfRpXh0X06DM=";
  };
  cargoHash = "sha256-3cdwL9ocrSybseg15Bsg4GdE96tvMbilDnpQHRJ+z0c=";
}
