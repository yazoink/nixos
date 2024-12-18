{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.gtklock.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.gtklock.enable {
    environment.systemPackages = with pkgs; [gtklock];
    security.pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
  };
}
