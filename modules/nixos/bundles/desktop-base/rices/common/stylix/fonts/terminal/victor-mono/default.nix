{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "VictorMono Nerd Font") {
    stylix = {
      fonts = {
        monospace = {
          name = "VictorMono Nerd Font";
          package = pkgs.nerd-fonts.victor-mono;
        };
      };
    };
  };
}
