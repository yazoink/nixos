{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    bundles.desktopFull.printing.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.printing.enable {
    networking.firewall = {
      allowedTCPPorts = [631];
      allowedUDPPorts = [631];
    };
    bundles.base.avahi.enable = true;
    services.printing = {
      enable = true;
      browsing = true;
      browsedConf = ''
        BrowseDNSSDSubTypes _cups,_print
        BrowseLocalProtocols all
        BrowseRemoteProtocols all
        CreateIPPPrinterQueues All
        BrowseProtocols all
      '';
      listenAddresses = ["*:631"];
      allowFrom = ["all"];
      defaultShared = true;
      openFirewall = true;
      drivers = with pkgs; [
        # fxlinuxprint
        # foomatic-db-ppds-withNonfreeDb
        gutenprint
        cups-filters
      ];
    };
  };
}
