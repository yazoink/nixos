{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-IWv7IfBNFHB5Gtg+YuUbXkn8Itvay/+Ix5VO1sfV5fk=";
  };
  cargoHash = "sha256-8Pwr7RGgsEnRbRXnh/q9q5SnUJBQNucw00XPSbvuuIE=";
}
