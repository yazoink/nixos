{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Cozette") {
    stylix = {
      fonts = {
        monospace = {
          name = "Cozette";
          package = pkgs.cozette;
        };
      };
    };
  };
}
