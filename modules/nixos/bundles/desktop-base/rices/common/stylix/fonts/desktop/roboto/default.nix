{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.desktop.name == "Roboto") {
    stylix = {
      fonts = {
        sansSerif = {
          package = pkgs.roboto;
          name = "Roboto";
        };
      };
    };
  };
}
