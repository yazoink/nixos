{pkgs, config, lib, ...}:
let
  usdtoaud = pkgs.callPackage ./usdtoaud.nix {};
in
{
  options = {
    bundles.desktopFull.usdtoaud.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.usdtoaud.enable {
    home.packages = [usdtoaud];
  };
}
