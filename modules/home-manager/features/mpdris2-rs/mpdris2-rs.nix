{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "mpdris2-rs";
  version = "1.0.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "szclsya";
    repo = "mpdris2-rs";
    rev = "trunk";
    sha256 = "sha256-JLcGHO9u8Dqt1eYEJr0zq/60f2G08V+yeNF0dP1NP3M=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-tB7ATjNTwnuwrWwFshuZWjcJsvcBaV7/I59pNhRNabg=";
}
