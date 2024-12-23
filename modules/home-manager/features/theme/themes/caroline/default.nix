# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.desktopTheme.enable && osConfig.myOptions.desktopTheme.name == "caroline") {
    gtk = {
      #iconTheme.name = "caroline-suru-aspromauros";
    };
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=caroline-kvantum
      '';
    "Kvantum/caroline-kvantum".source = ./caroline-kvantum;
    };
  };
}
