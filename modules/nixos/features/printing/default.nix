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
      browsing = true;
      browsed.conf = ''
        BrowseDNSSDSubTypes _cups,_print
        BrowseLocalProtocols all
        BrowseRemoteProtocols all
        CreateIPPPrinterQueues All
        BrowseProtocols all
      '';
      drivers = with pkgs;[
        fxlinuxprint 
        foomatic-db-ppds-withNonfreeDb
      ];
    };
  };
}
