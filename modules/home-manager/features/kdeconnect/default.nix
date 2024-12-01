{config, lib, ...}:
{
  options = {
    bundles.desktopFull.kdeconnect.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.kdeconnect.enable {
    services.kdeconnect.enable = true;
  };
}
