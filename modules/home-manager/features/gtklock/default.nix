{osConfig, config, lib, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopBase.gtklock.enable {
    xdg.configFile."gtklock/style.css".text = ''
      button {
        color: #${config.stylix.base16Scheme.base00};
      }
    '';
    xdg.configFile."gtklock/config.ini".text = ''
      [main]
      time-format=%I:%M %p
      style=.config/gtklock/style.css
    '';
  };
}
