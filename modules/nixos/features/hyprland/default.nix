# relies on hyprland home-manager module
{pkgs, inputs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.hyprland.enable {
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    environment.systemPackages = with pkgs; [
      libinput
      dbus
      xwayland
      wl-clipboard
      wl-clip-persist
      upower # for poweralertd
      kdePackages.qtwayland
      networkmanagerapplet
      wdisplays
      poweralertd
      grim
      slurp
      hyprpicker
      hyprcursor
      hypridle
      swaybg
      inputs.hyprland-qtutils.packages.${pkgs.stdenv.hostPlatform.system}.hyprland-qtutils
    ];

    services  = {
      upower.enable = true; # for poweralertd
      dbus.enable = true;
      libinput.enable = true;
    };

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };
}
