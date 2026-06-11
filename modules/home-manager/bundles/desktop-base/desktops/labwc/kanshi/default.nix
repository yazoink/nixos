{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  services.kanshi = {
    enable = true;
    profiles = {
      desktop = {
        outputs = [
          {
            criteria = "DP-1";
            scale = 1.35;
            status = "enable";
          }
          {
            criteria = "DP-2";
            scale = 1.35;
            status = "enable";
          }
        ];
      };
    };
  };
}
