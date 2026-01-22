{
  lib,
  osConfig,
  config,
  pkgs,
  inputs,
  ...
}: {
  stylix.targets.hyprland.enable = false;
  home.packages = with pkgs; [
    wl-clipboard
    wf-recorder
    wayland-pipewire-idle-inhibit
    wl-clip-persist
    networkmanagerapplet
    brightnessctl
    poweralertd
    grim
    slurp
    hyprpicker
    hyprcursor
    wdisplays
    swaybg
  ];
  wayland.windowManager.hyprland = lib.mkMerge [
    {
      enable = true;
      package = null;
      portalPackage = null;
    }
    # (import ./config {
    #   inherit lib osConfig config pkgs inputs;
    # })
  ];
}
