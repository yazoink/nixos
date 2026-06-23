{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Kosugi Maru") {
    stylix = {
      fonts = {
        sansSerif = {
          package = pkgs.callPackage ./font.nix {};
          name = "Kosugi Maru";
        };
      };
    };
  };
}
