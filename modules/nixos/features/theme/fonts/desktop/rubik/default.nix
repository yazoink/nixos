{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.desktop.name == "Rubik") {
    stylix = {
      fonts = {
        sansSerif = {
          package = pkgs.rubik;
          name = "Rubik";
        };
      };
    };
  };
}
