{
  lib,
  pkgs,
  ...
}: {
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 1000;
        command = "${lib.getExe pkgs.chayang} -d 15 && ${lib.getExe pkgs.wlopm} --off \*";
        resumeCommand = "${lib.getExe pkgs.wlopm} --on \*";
      }
      {
        timeout = 1500;
        command = "${lib.getExe pkgs.hyprlock}";
      }
      {
        timeout = 10000;
        command = "systemctl suspend";
      }
    ];
  };
}
