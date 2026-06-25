# common configs
{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (config.myOptions.desktopTheme) colorscheme;
in
  lib.mkMerge [
    (import ./${colorscheme} {inherit pkgs;})
  ]
