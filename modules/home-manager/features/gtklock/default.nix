{osConfig, lib, ...}:
{
  options = {
    bundles.base.pswdrs.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf osConfig.bundles.desktopBase.gtklock.enable {
    xdg.configFile."gtklock/config.ini".text = ''
      [main]
      gtk-theme=adw-gtk3
    '';
  };
}
