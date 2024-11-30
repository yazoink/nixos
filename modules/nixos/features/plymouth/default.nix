{config, lib, ...}:
{
  options = {
    bundles.desktopBase.plymouth.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.plymouth.enable {
    boot.plymouth.enable = true;
  };
}
