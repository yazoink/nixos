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
        after_sleep_cmd = "${lib.getExe pkgs.wlopm} --on \\*";
      };
      listener = [
        {
          timeout = 300; # 5 mins
          on-timeout = "lock";
        }
        {
          timeout = 310;
          on-timeout = "${lib.getExe pkgs.wlopm} --off \\*";
          on-resume = "${lib.getExe pkgs.wlopm} --on \\*";
        }
        {
          timeout = 1800; # 30 mins
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
