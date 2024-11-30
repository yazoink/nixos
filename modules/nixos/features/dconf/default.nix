{config, lib, ...}:
{
  options = {
    bundles.desktopBase.dconf.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.dconf.enable {
    programs.dconf.enable = true;
  };
}
