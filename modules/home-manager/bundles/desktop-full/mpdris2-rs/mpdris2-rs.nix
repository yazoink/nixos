{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-oiyqK7vj41d9bsXBtenc477SOrVHRkXpFljkN8MjdQg=";
  };
  cargoHash = "sha256-xdgUKU9YiaC3o1uH38ZjvQgR78B/1LqTPis4+XqinQ8=";
}
