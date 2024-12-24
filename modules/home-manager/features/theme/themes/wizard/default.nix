# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.desktopTheme.enable && osConfig.myOptions.desktopTheme.name == "wizard") {
    gtk = {
      iconTheme.name = "Wizard-Icons";
    };
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=KvWizard
      '';
    "Kvantum/KvWizard".source = ./KvWizard;
    };
  };
}
