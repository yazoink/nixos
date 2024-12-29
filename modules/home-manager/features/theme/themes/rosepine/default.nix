# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "rosepine") {
    gtk = {
      iconTheme.name = "Rose-Pine-Moon";
    };
  };
}
