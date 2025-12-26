{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.myOptions.hardwareFeatures.bluetooth.enable {
    services.blueman = {
      enable = lib.mkIf config.myOptions.bundles.desktopBase.enable true;
    };
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = false;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };
}
