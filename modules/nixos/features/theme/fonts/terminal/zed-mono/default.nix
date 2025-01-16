{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "ZedMono Nerd Font") {
    stylix = {
      fonts = {
        monospace = {
          name = "ZedMono Nerd Font";
          package = pkgs.nerd-fonts.zed-mono;
        };
      };
    };
  };
}
