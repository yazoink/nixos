{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.desktop.name == "DM Sans") {
    stylix = {
      fonts = {
        sansSerif = {
          package = pkgs.dm-sans;
          name = "DM Sans";
        };
      };
    };
  };
}
