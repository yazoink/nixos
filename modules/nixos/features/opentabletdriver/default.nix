{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.myOptions.hardwareFeatures.opentabletdriver.enable {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
