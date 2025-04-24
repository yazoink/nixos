{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.bundles.base.bootloader.enable && config.myOptions.hardwareFeatures.bootloader.type == "uefi") {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
