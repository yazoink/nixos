{osConfig, lib, config, pkgs, ...}:
let
inherit (config.wayland.windowManager.sway) package;
in
{
  config = lib.mkIf osConfig.bundles.desktopBase.sway.enable {
    services.hypridle = builtins.trace "hypridle enabled" {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "${package}/bin/swaymsg \"output * dpms on\"";
          ignore_dbus_inhibit = false;
          lock_cmd = "${lib.getExe pkgs.gtklock}";
        };
        listener = [
          {
            timeout = 900;
            on-timeout = "${lib.getExe pkgs.gtklock}";
          }
          {
            timeout = 1200;
            on-timeout = "${package}/bin/swaymsg \"output * dpms off\"";
            on-resume = "${package}/bin/swaymsg \"output * dpms on\"";
          }
        ];
      };
    };
  };
}
