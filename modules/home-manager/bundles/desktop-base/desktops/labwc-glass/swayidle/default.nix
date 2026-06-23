{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 500;
        command = "${lib.getExe pkgs.hyprlock}";
      }
      {
        timeout = 1000;
        command = "${lib.getExe pkgs.wlopm} --off \*";
        resumeCommand = "${lib.getExe pkgs.wlopm} --on \*";
      }
      {
        timeout = 10000;
        command = "systemctl suspend";
      }
    ];
  };
}
