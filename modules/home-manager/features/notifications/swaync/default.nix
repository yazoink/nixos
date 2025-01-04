{config, lib, ...}:
{
  options = {
    bundles.desktopBase.swaync.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.swaync.enable {
    services.swaync = {
      enable = true;
    };
  };
}
