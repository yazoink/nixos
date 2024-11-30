{pkgs, config, lib, ...}:
let
  kjtocal = pkgs.callPackage ./kjtocal.nix {};
in
{
  options = {
    bundles.desktopFull.kjtocal.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.kjtocal.enable {
    home.packages = [kjtocal];
  };
}
