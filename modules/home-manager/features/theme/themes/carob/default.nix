# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.desktopTheme.enable && osConfig.myOptions.desktopTheme.name == "carob") {
    gtk = {
      iconTheme.name = "Carob";
    };
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=KvCarob
      '';
    "Kvantum/KvCarob".source = ./KvCarob;
    };
  };
}
