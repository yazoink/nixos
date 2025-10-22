{
  pkgs,
  config,
  lib,
  ...
}: let
  hyprland-monitor-attached = pkgs.callPackage ./hyprland-monitor-attached.nix {};
in {
  options = {
    bundles.desktopBase.hyprlandMonitorAttached.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.hyprlandMonitorAttached.enable {
    home.packages = [hyprland-monitor-attached];
  };
}
