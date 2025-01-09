# depends on system theme module
{osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "gruvbox-material-dark-hard") {
    gtk = {
      iconTheme.name = "Gruvbox-Plus-Dark";
    };
  };
}
