{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Aporetic Sans Mono") {
    stylix = {
      fonts = {
        monospace = {
          name = "Aporitic Sans Mono Bold";
          package = pkgs.aporetic;
        };
      };
    };
  };
}
