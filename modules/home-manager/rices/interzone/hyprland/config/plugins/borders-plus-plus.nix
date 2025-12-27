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
        col.border_1 = "rgb(${config.stylix.base16Scheme.base04})";
        border_size_1 = 1;
      };
    };
  };
}
