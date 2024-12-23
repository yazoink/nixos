# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.desktopTheme.enable && osConfig.myOptions.desktopTheme.name == "manuscript") {
    gtk = {
      iconTheme.name = "Manuscript-Icons";
    };
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=KvManuscript
      '';
    "Kvantum/KvManuscript".source = ./KvManuscript;
    };
  };
}
