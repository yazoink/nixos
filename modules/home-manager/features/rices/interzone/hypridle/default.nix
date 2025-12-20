{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [brightnessctl];
  services.hypridle = builtins.trace "hypridle enabled" {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };
      listener = [
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1200;
          on-timeout = "hyprlock";
        }
      ];
    };
  };
}
