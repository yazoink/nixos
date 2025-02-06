# depends on system theme module
{
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "gruvbox-material-dark-hard") {
    stylix = {
      iconTheme.dark = "Gruvbox-Plus-Dark";
    };
  };
}
