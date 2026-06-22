{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "rose-pine-icons";

  src = pkgs.fetchFromGitHub {
    owner = "Henriquehnnm";
    repo = "rose-pine-icon-theme";
    rev = "main";
    sha256 = "sha256-/CGj07sgM4kGQVRSW//tyYrRzh5puPTONLxWPNzeZNM=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/icons/RoséPine $out/share/icons
  '';
}
