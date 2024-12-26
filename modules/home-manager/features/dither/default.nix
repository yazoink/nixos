{pkgs, config, lib, ...}:
let
  dither = pkgs.callPackage ./dither.nix {};
in
{
  options = {
    bundles.desktopBase.dither = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      package = lib.mkOption {
        type = lib.types.package;
      };
    };
  };
  config = lib.mkIf config.bundles.desktopBase.dither.enable {
    bundles.desktopBase.dither.package = dither;
  };
}
