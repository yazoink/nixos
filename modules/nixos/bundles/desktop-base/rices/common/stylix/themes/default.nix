# common configs
{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme) colorscheme;
in
  lib.mkMerge [
    (import ./${colorscheme} {inherit pkgs;})
  ]
