{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Terminess Nerd Font") {
    stylix = {
      fonts = {
        monospace = {
          name = "Terminess Nerd Font";
          package = pkgs.nerd-fonts.terminess-ttf;
        };
      };
    };
  };
}
