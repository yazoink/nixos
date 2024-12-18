{pkgs, config, lib, ...}:
let
  audtousd = pkgs.callPackage ./audtousd.nix {};
in
{
  options = {
    bundles.desktopFull.audtousd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.audtousd.enable {
    home.packages = [audtousd];
  };
}
