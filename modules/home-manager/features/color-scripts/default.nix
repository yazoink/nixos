{pkgs, config, lib, ...}:
let
  color-scripts = pkgs.callPackage ./color-scripts.nix {};
in
{
  options = {
    bundles.desktopFull.colorScripts.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.colorScripts.enable {
    home.packages = [color-scripts];
  };
}
