{osConfig, lib, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    services.hypridle = builtins.trace "hypridle enabled" {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
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
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}