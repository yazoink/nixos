{pkgs, config, lib, osConfig, ...}:
let
  script = ./script.sh;
  replacecolor = pkgs.callPackage ./replacecolor.nix {};
in
{
  options = {
    utils.replacecolor = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      package = lib.mkOption {
        type = lib.types.package;
      };
    };
  };
  config = lib.mkIf config.bundles.desktopBase.simpleLogout.enable {
    utils.replacecolor.package = replacecolor;
    home.packages = [config.bundles.desktopBase.replacecolor.package];
  };
}
