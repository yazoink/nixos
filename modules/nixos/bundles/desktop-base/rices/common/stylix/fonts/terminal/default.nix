{pkgs, ...}: let
  # inherit (config.myOptions.desktopTheme) colorscheme;
  font = "aporetic-serif-mono";
in {
  monospace = import (./. + "/${font}") {inherit pkgs;};
}
