{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-ro5k6zYg36NJoyGkuH2dh8KNUWt+J/eFuyst/r8Jr3E=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-tB7ATjNTwnuwrWwFshuZWjcJsvcBaV7/I59pNhRNabg=";
}
