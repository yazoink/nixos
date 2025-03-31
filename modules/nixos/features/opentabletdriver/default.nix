{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    bundles.desktopFull.opentabletdriver.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.opentabletdriver.enable {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
