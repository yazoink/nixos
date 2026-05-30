{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Iosevka Nerd Font") {
    stylix = {
      fonts = {
        monospace = {
          name = "Iosevka Nerd Font";
          package = pkgs.nerd-fonts.iosevka;
        };
      };
    };
  };
}
