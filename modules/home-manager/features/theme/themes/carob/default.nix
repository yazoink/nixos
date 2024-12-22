# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.desktopTheme.enable && osConfig.myOptions.desktopTheme.name == "caroline") {
    gtk = {
      iconTheme.name = "Carob";
    };
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=carob-kvantum
      '';
    "Kvantum/carob-kvantum".source = ./carob-kvantum;
    };
  };
}
