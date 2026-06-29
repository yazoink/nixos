{
  pkgs,
  config,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
  margin = 8;
in {
  home.packages = with pkgs; [eww font-awesome];
  # requires EWW_CONFIG_DIR env variable to be set to work
  # toggle power menu with launch-power-menu.sh
  # launch corners with launch-corners.sh
  xdg.configFile = {
    "widgets" = {
      source = ./config;
      recursive = true;
      force = true;
    };
    "widgets/_colours.scss".text = with colors; ''
      $border: #${base02};
      $bg: #${base00};
      $bg2: #${base01};
      $bg3: #${base02};
      $bg4: #${base03};
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
