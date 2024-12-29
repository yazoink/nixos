# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "wizard") {
    gtk = {
      iconTheme.name = "Wizard-Icons";
    };
  };
}
