# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.desktopTheme.enable && osConfig.myOptions.desktopTheme.name == "tarot") {
    gtk = {
      iconTheme.name = "Tarot-Icons";
    };
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=KvTarot
      '';
    "Kvantum/KvTarot".source = ./KvTarot;
    };
  };
}
