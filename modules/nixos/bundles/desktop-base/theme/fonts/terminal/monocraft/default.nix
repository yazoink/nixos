{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Monocraft") {
    stylix = {
      fonts = {
        monospace = {
          name = "Monocraft";
          package = pkgs.monocraft;
        };
      };
    };
  };
}
