{config, lib, pkgs, ...}:
{
  options = {
    bundles.desktopFull.printing.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.printing.enable {
    bundles.base.avahi.enable = true;
    services.printing = {
      enable = true;
      drivers = with pkgs; [gutenprint gutenprintBin fxlinuxprint foomatic-db-ppds];
    };
  };
}
