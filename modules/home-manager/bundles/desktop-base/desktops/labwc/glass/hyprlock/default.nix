{config, ...}: let
  confFile = config.lib.stylix.colors {
    template = ./hyprlock-colors.conf.mustache;
    extension = "conf";
  };
in {
  xdg.configFile = {
    "hypr/hyprlock-colors.conf".source = confFile;
  };
}
