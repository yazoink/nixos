{
  lib,
  osConfig,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [./hypridle.nix];
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    stylix.targets.hyprland.enable = false;
    bundles.desktopBase = {
      mako.enable = true;
      # wofi.enable = true;
      walker.enable = true;
      # ironbar.enable = true;
      waybar.enable = true;
      screenshot.enable = true;
      # hyprViewBinds.enable = true; # nix package stopped building, fix later
      swayosd.enable = true;
      eww.enable = true;
      hyprlandMonitorAttached.enable = true;
    };
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
      (import ./config {
        inherit lib osConfig config pkgs inputs;
      })
    ];
  };
}
