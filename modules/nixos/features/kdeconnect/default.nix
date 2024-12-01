{config, lib, ...}:
{
  options = {
    bundles.desktopFull.kdeconnect.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.kdeconnect.enable {
    programs.kdeconnect.enable = true;
    networking.firewall.allowedTCPPorts = [1764];
    networking.firewall.allowedUDPPorts = [1764];
  };
}
