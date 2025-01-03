{pkgs, config, lib, ...}:
let
  dither = pkgs.callPackage ./dither.nix {};
in
{
  options = {
    utils.dither = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      package = lib.mkOption {
        type = lib.types.package;
      };
    };
  };
  config = lib.mkIf config.utils.dither.enable {
    home.packages = [pkgs.imagemagick];
    bundles.desktopBase.dither.package = dither;
  };
}
