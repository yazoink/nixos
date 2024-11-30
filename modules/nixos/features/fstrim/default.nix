{config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.fstrim.enable {
    services.fstrim.enable = true;
  };
}
