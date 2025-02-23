{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-MyESf5xO3dcXUzx7wjz0NZR/zf/GcAK3dCC+c3lN9VU=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-Lbs94OSyLd4hGMUeDGbjaLstd7ACfE7Tbrbz3uAyKoY=";
}
