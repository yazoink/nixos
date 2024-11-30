{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopFull.mullvad.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.mullvad.enable {
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
        package = pkgs.mullvad-vpn;
      };
    };
  };
}
