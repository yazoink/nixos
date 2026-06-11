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
            criteria = "Dell Inc. DELL U2715H 6VY7R72K01YS";
            scale = 1.35;
            status = "enable";
          }
        ];
      };
    };
  };
}
