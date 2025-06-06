{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.desktop.name == "Gabarito") {
    stylix = {
      fonts = {
        sansSerif = {
          package = pkgs.callPackage ./font {};
          name = "Gabarito";
        };
      };
    };
  };
}
