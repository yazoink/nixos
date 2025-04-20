# depends on system theme module
{
  pkgs,
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.desktopTheme.name == "catppuccin-mocha") {
    stylix = {
      iconTheme.dark = "Papirus";
      iconTheme.package = pkgs.catppuccin-papirus-folders;
    };
  };
}
