{config, lib, ...}:
{
  options = {
    bundles.desktopFull.printing.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.printing.enable {
    services.printing.enable = true;
  };
}
