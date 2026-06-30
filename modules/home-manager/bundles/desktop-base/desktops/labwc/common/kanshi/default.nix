{...}: {
  services.kanshi = {
    enable = true;
    systemdTarget = "labwc-session.target";
  };
  xdg.configFile."kanshi/config".text = ''
    output "Dell Inc. DELL U2715H 6VY7R72K01YS" {
      scale 1.5
    }
  '';
}
