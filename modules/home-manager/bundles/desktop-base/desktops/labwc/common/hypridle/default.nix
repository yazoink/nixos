{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [brightnessctl];
  services.hypridle = builtins.trace "hypridle enabled" {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "${lib.getExe pkgs.wlopm} --on \\*";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };
      listener = [
        {
          timeout = 900;
          on-timeout = "${lib.getExe pkgs.chayang} -d 15 && ${lib.getExe pkgs.wlopm} --off \\*";
          on-resume = "${lib.getExe pkgs.wlopm} --on \\*";
        }
        {
          timeout = 1200;
          on-timeout = "${lib.getExe pkgs.hyprlock}";
        }
        {
          timeout = 5000;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
