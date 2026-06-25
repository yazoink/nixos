{
  lib,
  pkgs,
  config,
  ...
}: let
  # inherit (config.myOptions.desktopTheme) colorscheme;
  colorscheme = "moonfly";
in (import (./. + "/${colorscheme}") {inherit pkgs;})
