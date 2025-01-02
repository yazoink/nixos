{osConfig, lib, pkgs, config, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopBase.sway.enable {
    services.swayidle = {
      enable = true;
      events = [
        {
          event = "before-sleep";
          command = "${lib.getExe pkgs.gtklock}";
        }
        {
          event = "after-resume";
          command = ''${lib.getExe config.wayland.windowManager.sway.package "swaymsg"} "output * dpms on"'';
        }
        {
          event = "lock";
          command = "${lib.getExe pkgs.gtklock}";
        }
      ];
      timeouts = [
        {
          timeout = 1200;
          command = "${lib.getExe pkgs.gtklock}";
        }
        {
          timeout = 900;
          command = ''${lib.getExe config.wayland.windowManager.sway.package "swaymsg"} "output * dpms off"'';
        }
      ];
    };
  };
}
