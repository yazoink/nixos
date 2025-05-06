# relies on hyprland home-manager module
{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  options = {
    bundles.desktopBase.hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.hyprland.enable {
    bundles.desktopBase = {
      gtklock.enable = true;
    };
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    environment.systemPackages = with pkgs; [
      wl-clipboard
      wayland-pipewire-idle-inhibit
      wl-clip-persist
      upower # for poweralertd
      networkmanagerapplet
      brightnessctl
      poweralertd
      grim
      slurp
      hyprpicker
      hyprcursor
      nwg-displays
      swaybg
    ];

    services = {
      upower.enable = true; # for poweralertd
      dbus.enable = true;
      libinput.enable = true;
    };
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      withUWSM = false;
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      config.common = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = ["hyprland" "gtk"];
      };
    };
  };
}
