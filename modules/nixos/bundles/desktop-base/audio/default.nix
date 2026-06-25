{pkgs, ...}: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
  environment.systemPackages = with pkgs; [
    alsa-utils
    #lxqt.pavucontrol-qt
    pavucontrol
    pamixer
    playerctl
  ];
}
