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
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
      {
        timeout = 1000;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
