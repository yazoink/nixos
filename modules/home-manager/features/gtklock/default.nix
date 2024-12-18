{osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopBase.gtklock.enable {
    xdg.configFile."gtklock/config.ini".text = ''
      [main]
      gtk-theme=adw-gtk3
    '';
  };
}
