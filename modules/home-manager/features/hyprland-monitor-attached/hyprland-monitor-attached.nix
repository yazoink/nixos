{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "hyprland-monitor-attached";
  version = "0.1.6";
  src = pkgs.fetchFromGitHub {
    owner = "coffebar";
    repo = "hyprland-monitor-attached";
    rev = "main";
    sha256 = "sha256-ZEtZYrr/gatkfKLjvmN3JPV/gzHExoW1PbQ9gsiE15w=";
  };
  cargoHash = "sha256-8Pwr7RGgsEnRbRXnh/q9q5SnUJBQNucw00XPSbvuuIE=";
}
