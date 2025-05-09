# didn't compile last time I tried
{
  pkgs,
  lib,
  osConfig,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.hardwareFeatures) touchscreen;
in {
  config =
    lib.mkIf osConfig.bundles.desktopBase.hyprland.enable
    && touchscreen.enable {
      wayland.windowManager.hyprland = {
        plugins = [
          inputs.hyprgrass.packages.${pkgs.system}.default
        ];
        settings = {
          plugin = {
            touch_gestures = {
              sensitivity = touchscreen.hyprlandGestureSensitivity;
              workspace_swipe_fingers = 3;
              workspace_swipe_edge = "d";
              long_press_delay = 400;
              resize_on_border_long_press = true;
              edge_margin = 15;
              hyprgrass-bind = [
                # swipe left from right edge
                ", edge:r:l, workspace, +1"
                # swipe down from top edge
                ", edge:u:d, exec, pkill wofi || wofi --show drun"
                # swipe down with 4 fingers
                ", swipe:4:d, killactive"
                # swipe down from left edge
                ", edge:l:d, exec, pamixer -d 5"
                # swipe up from left edge
                ", edge:l:u, exec, pamixer -i 5"
                # longpress
                ", longpress:2, movewindow"
                ", longpress:3, resizewindow"
              ];
            };
          };
        };
      };
    };
}
