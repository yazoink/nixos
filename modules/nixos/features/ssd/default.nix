{config, lib, ...}:
{
  config = lib.mkIf config.myOptions.hardwareFeatures.ssd.enable {
    services.fstrim.enable = true;
  };
}
