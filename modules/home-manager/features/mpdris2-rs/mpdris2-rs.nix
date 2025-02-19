{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-c9CI5KaC9wyfnYUvAIdq/4fznb7ehe5qbUiQ9ooPG+M=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-Lbs94OSyLd4hGMUeDGbjaLstd7ACfE7Tbrbz3uAyKoY=";
}
