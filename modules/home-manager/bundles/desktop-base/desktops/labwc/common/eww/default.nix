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
    "eww/scripts" = {
      source = ./config/scripts;
      recursive = true;
      force = true;
    };
    "eww/images" = {
      source = ./config/images;
      recursive = true;
      force = true;
    };
    "eww/launch-calendar.sh".source = ./config/launch-calendar.sh;
    "eww/launch-power-menu.sh".source = ./config/launch-power-menu.sh;
  };
}
