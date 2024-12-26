# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.desktopTheme.enable && osConfig.myOptions.desktopTheme.name == "carob") {
    gtk = {
      iconTheme.name = "Carob";
    };
  };
}
