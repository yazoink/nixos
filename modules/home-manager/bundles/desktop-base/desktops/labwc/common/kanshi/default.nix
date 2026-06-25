{...}: {
  services.kanshi = {
    enable = true;
    systemdTarget = "labwc-session.target";
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
