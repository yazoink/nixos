{
  lib,
  pkgs,
  ...
}: {
  services.hypridle = builtins.trace "hypridle enabled" {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
        # after_sleep_cmd = "${lib.getExe pkgs.wlopm} --on \\*";
        # before_sleep_cmd = "loginctl lock-session";
      };
      listener = [
        {
          timeout = 300; # 5 mins
          on-timeout = "${lib.getExe pkgs.chayang} -d 15 && ${lib.getExe pkgs.wlopm} --off \\*";
          on-resume = "${lib.getExe pkgs.wlopm} --on \\*";
        }
        {
          timeout = 330;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1800; # 30 mins
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
