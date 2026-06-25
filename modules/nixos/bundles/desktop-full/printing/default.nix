# avahi module needed for network printing
{pkgs, ...}: {
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
    drivers = with pkgs; [
      fxlinuxprint
      gutenprint
      cups-filters
    ];
  };
}
