# relies on hyprland home-manager module
{
  pkgs,
  inputs,
  ...
}: {
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  services = {
    upower.enable = true; # for poweralertd
    dbus.enable = true;
    libinput.enable = true;
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    package = pkgs.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # portalPackage = pkgs.xdg-desktop-portal-hyprland;
    withUWSM = false;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      # xdg-desktop-portal-hyprland
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
}
