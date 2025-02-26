{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-l0uX4EDsLRvJWE9eY9tAbrVmM3Oqkyj0WYgc7CMTrLc=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-vNMXcoSWTAWDGdRqQRbyGvO6rUf3BJpFmleqhCcX1nA=";
}
