{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Consolas") {
    stylix = {
      fonts = {
        monospace = {
          name = "Consolas";
          package = pkgs.vistafonts;
        };
      };
    };
  };
}
