{pkgs, config, lib, ...}:
let
  screenshot = pkgs.callPackage ./screenshot.nix {};
in
{
  options = {
    bundles.desktopBase.screenshot = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      package = lib.mkOption {
        type = lib.types.package;
      };
    };
  };
  config = lib.mkIf config.bundles.desktopBase.screenshot.enable {
    bundles.desktopBase.screenshot.package = screenshot;
    home.packages = [config.bundles.desktopBase.screenshot.package];
  };
}
