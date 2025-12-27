{
  pkgs,
  config,
  osConfig,
  inputs,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  themeName = osConfig.myOptions.desktopTheme.colorscheme;
in {
  plugins = [
    inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.borders-plus-plus
  ];
  settings = {
    plugin = {
      borders-plus-plus = {
        add_borders = 0;
        col.border_1 = "rgb(ffffff)";
        natural_rounding = "yes";
        border_size_1 = 3;
      };
    };
  };
}
