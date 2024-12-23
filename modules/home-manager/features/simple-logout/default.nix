{pkgs, config, lib, osConfig, ...}:
let
  simpleLogout = pkgs.callPackage ./simple-logout.nix {};
  styleCss = config.lib.stylix.colors {
    template = ./config/style.css.mustache;
    extension = ".css";
  };
in
{
  options = {
    bundles.desktopBase.simpleLogout.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.simpleLogout.enable {
    home = {
      packages = [simpleLogout];
      file = {
        ".config/simple-logout/icons".source = ./config/icons/${osConfig.myOptions.desktopTheme.name};
        ".config/simple-logout/config.json".source = ./config/config.json;
        ".config/simple-logout/style.css".source = styleCss;
      };
    };
  };
}
