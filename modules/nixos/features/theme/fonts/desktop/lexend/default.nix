{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.desktop.name == "Lexend") {
    stylix = {
      fonts = {
        sansSerif = {
          package = pkgs.lexend;
          name = "Lexend";
        };
      };
    };
  };
}
