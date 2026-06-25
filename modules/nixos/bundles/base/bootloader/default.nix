{
  config,
  lib,
  ...
}: let
  inherit (config.myOptions.hardwareFeatures) bootloader;
in {
  boot.loader = lib.mkMerge [
    (
      lib.mkIf (bootloader.type == "uefi")
      {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      }
    )
    (
      lib.mkIf (bootloader.type == "legacy")
      {
        grub = let
          inherit (bootloader.legacy) bootDrive customResolution;
        in {
          enable = true;
          device = bootDrive;
          gfxmodeBios = lib.mkIf customResolution.enable customResolution.resolution;
          theme = null;
          splashImage = null;
        };
      }
    )
  ];
}
