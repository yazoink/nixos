{
  pkgs,
  config,
  osConfig,
  inputs,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
in {
  plugins = [
    inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.borders-plus-plus
  ];
  settings = {
    plugin = {
      borders-plus-plus = {
        natural_rounding = "yes";
        add_borders = 2;
        col.border_1 = "rgb(ffffff)";
        col.border_2 = "rgb(000000)";
        border_size_1 = 3;
        border_size_2 = 3;
      };
    };
  };
}
