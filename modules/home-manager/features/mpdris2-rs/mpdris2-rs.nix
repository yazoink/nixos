{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-Wp5VkmHpwaKpb0019fgUT2nIrpogEXzvC0EIjUPi6Jw=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-vNMXcoSWTAWDGdRqQRbyGvO6rUf3BJpFmleqhCcX1nA=";
}
