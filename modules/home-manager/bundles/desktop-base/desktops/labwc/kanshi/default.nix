{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  services.kanshi = {
    enable = true;
    extraConfig = ''
      profile {
        output DP-1
        mode 2560x1440@59.951000Hz
        position 0,0
        scale 1.35
      }
      profile {
        output DP-2
        mode 2560x1440@59.951000Hz
        position 0,0
        scale 1.35
      }
    '';
  };
}
