{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "oneui4-icons";

  src = pkgs.fetchFromGitHub {
    owner = "end-4";
    repo = "OneUI4-Icons";
    rev = "main";
    sha256 = "sha256-f5t7VGPmD+CjZyWmhTtuhQjV87hCkKSCBksJzFa1x1Y=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/OneUI-dark $out/share/icons
    cp -r $src/OneUI-light $out/share/icons
  '';
}
