{
  pkgs,
  config,
  osConfig,
  inputs,
  ...
}: {
  plugins = [
    inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.borders-plus-plus
  ];
  settings = {
    plugin = {
      borders-plus-plus = {
        natural_rounding = "yes";
        add_borders = 1;
        col.border_1 = "rgb(000000)";
        col.border_2 = "rgb(ffffff)";
        border_size_1 = 5;
        border_size_2 = 3;
      };
    };
  };
}
