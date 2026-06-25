{pkgs, ...}: {
  programs = {
    file-roller.enable = true;
  };

  environment.systemPackages = with pkgs; [pcmanfm cifs-utils];

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
