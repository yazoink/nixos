{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.gnomeKeyring.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.gnomeKeyring.enable {
    services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = with pkgs; [seahorse];
  };
}
