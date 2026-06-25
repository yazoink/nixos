# common configs
{
  lib,
  pkgs,
  ...
}: let
  inherit (config.myOptions.desktopTheme) colorscheme;
in
  lib.mkMerge [
    (import ./${colorscheme} {inherit pkgs;})
  ]
