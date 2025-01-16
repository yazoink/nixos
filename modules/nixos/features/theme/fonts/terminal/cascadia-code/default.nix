{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.terminal.name == "Cascadia Code") {
    stylix = {
      fonts = {
        monospace = {
          name = "Cascadia Code";
          package = pkgs.cascadia-code;
        };
      };
    };
  };
}
