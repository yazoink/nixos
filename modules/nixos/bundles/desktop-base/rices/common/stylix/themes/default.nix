{config, ...}: let
  inherit (config.myOptions.desktopTheme) colorscheme;
in {
  imports = [
    (./. + "/${colorscheme}")
  ];
}
