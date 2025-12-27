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
        "col.border_1" = "rgb(${config.stylix.base16Scheme.base02})";
        border_size_1 = 1;
      };
    };
    windowrule = [
      "match:focus true, borders-plus-plus:title_color rgb(${config.stylix.base16Scheme.base05})"
    ];
  };
}
