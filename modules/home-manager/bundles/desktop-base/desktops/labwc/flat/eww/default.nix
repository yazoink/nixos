{
  pkgs,
  config,
  ...
}: let
  inherit (config.lib.stylix) colors;
  margin = 4;
in {
  home.packages = with pkgs; [eww font-awesome];
  xdg.configFile = {
    "eww" = {
      source = ./config;
      recursive = true;
      force = true;
    };
    "eww/_colours.scss".text = with colors; ''
      $border: #${base01};
      $bg: #${base00};
      $bg2: rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.09);
      $bg3: #${base02};
      $fg: #${base05};
      $red: #${base08};
      $yellow: #${base0A};
      $green: #${base0B};
      $blue: #${base0D};
      $purple: #${base0E};
      $margin: ${builtins.toString margin}px;
    '';
  };
}
