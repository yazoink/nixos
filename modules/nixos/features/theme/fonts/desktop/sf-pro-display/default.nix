{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.fonts.desktop.name == "SF Pro Display") {
    stylix = {
      fonts = {
        monospace = {
          package = pkgs.callPackage ./sf-pro-display {};
          name = "SF Pro Display";
        };
      };
    };
  };
}
