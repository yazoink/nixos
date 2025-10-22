{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "hyprland-monitor-attached";
  version = "0.1.6";
  src = pkgs.fetchFromGitHub {
    owner = "coffebar";
    repo = "hyprland-monitor-attached";
    rev = "main";
    sha256 = "sha256-+bgOOm1B513COcWdUIJ/+GREQH5CR8/RNOcZVkjO2hI=";
  };
  cargoHash = "sha256-pBg5R7k3xEE1EoSdLO4jmibTnGE+ndZnkWeMO+UXN6Q=";
}
