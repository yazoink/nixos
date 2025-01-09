{osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopBase.sway.enable {
    services.hypridle = builtins.trace "hypridle enabled" {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "swaymsg \"output * dpms on\"";
          ignore_dbus_inhibit = false;
          lock_cmd = "gtklock";
        };
        listener = [
          {
            timeout = 900;
            on-timeout = "gtklock";
          }
          {
            timeout = 1200;
            on-timeout = "swaymsg \"output * dpms off\"";
            on-resume = "swaymsg \"output * dpms on\"";
          }
        ];
      };
    };
  };
}
