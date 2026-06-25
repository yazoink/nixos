{...}: {
  networking = {
    nameservers = [];
    networkmanager.dns = "systemd-resolved";
  };

  services = {
    resolved = {
      enable = true;
    };

    mullvad-vpn = {
      enable = true;
    };
  };
}
