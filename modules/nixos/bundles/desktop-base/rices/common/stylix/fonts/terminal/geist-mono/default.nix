{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "GeistMono Nerd Font") {
    stylix = {
      fonts = {
        monospace = {
          name = "GeistMono Nerd Font";
          package = pkgs.nerd-fonts.geist-mono;
        };
      };
    };
  };
}
