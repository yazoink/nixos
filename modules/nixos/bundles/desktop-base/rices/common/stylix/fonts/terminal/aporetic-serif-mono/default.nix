{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Aporetic Serif Mono") {
    stylix = {
      fonts = {
        monospace = {
          name = "Aporetic Serif Mono";
          package = pkgs.aporetic;
        };
      };
    };
  };
}
