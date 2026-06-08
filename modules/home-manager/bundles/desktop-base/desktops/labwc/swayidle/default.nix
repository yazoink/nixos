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
        command = "hyprlock";
      }
      {
        timeout = 1000;
        command = "systemctl suspend";
      }
    ];
  };
}
