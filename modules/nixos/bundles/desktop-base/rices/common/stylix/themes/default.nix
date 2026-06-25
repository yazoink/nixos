{
  pkgs,
  theme,
  ...
}: let
  # inherit (config.myOptions.desktopTheme) colorscheme;
  # colorscheme = "moonfly";
in (import (./. + "/${theme}") {inherit pkgs;})
