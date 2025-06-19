{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-zIyVlv1LL+uJq8/nfzj9xOyHN22srQpPlUgxkRDnNUg=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-AhzSA26KgFCL03W0+TOTSy0e5t4owA3TUM/+mbI6dmg=";
}
