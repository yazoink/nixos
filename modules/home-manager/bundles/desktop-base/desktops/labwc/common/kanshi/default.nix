{...}: {
  services.kanshi = {
    enable = true;
    systemdTarget = "labwc-session.target";
    settings = [
      {
        output.criteria = "Dell Inc. DELL U2715H 6VY7R72K01YS";
        output.scale = 1.5;
      }
    ];
  };
}
