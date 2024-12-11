{pkgs, config, lib, ...}:
let
  themeFile = config.lib.stylix.colors {
    template = ./my.theme.css.mustache;
    extension = ".css";
  };
in
{
  options = {
    bundles.desktopFull.vesktop.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.vesktop.enable {
    home.packages = with pkgs; [
      vesktop
    ];
    xdg.configFile."vesktop/themes/my.theme.css".source = themeFile;
  };
}
