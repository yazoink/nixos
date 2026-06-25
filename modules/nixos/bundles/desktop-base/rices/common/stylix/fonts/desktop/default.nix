{pkgs, ...}: let
  # inherit (config.myOptions.desktopTheme) colorscheme;
  font = "gabarito";
in {
  sansSerif = import (./. + "/${font}") {inherit pkgs;};
}
