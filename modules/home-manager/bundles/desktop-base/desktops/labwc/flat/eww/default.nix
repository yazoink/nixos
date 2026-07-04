{
  pkgs,
  config,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  home.packages = with pkgs; [eww font-awesome jq curl];
  xdg.configFile = {
    "eww" = {
      source = ./config;
      recursive = true;
      force = true;
    };
    "eww/_colours.scss".text = with colors; ''
      $base00: #${base00};
      $base01: #${base01};
      $base04: #${base04};
      $base05: #${base05};
      $base08: #${base08};
      $base0A: #${base0A};
      $base0B: #${base0B};
      $base0D: #${base0D};
      $base0E: #${base0E};
      $surface: rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.09);
      $surface-lighter: rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.18);
    '';
  };
}
