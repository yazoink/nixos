{
  lib,
  config,
  ...
}: let
  inherit (config.myOptions.bundles) desktopBase;
in {
  services.blueman.enable = lib.mkIf desktopBase.enable true;
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
}
