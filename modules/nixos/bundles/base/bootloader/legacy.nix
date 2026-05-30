{
  config,
  lib,
  ...
}: let
  inherit (config.myOptions.hardwareFeatures.bootloader.legacy) bootDrive customResolution;
in {
  config = lib.mkIf (config.bundles.base.bootloader.enable && config.myOptions.hardwareFeatures.bootloader.type == "legacy") {
    boot.loader = {
      grub = {
        enable = true;
        device = bootDrive;
        gfxmodeBios = lib.mkIf customResolution.enable customResolution.resolution;
        theme = null;
        splashImage = null;
      };
    };
  };
}
