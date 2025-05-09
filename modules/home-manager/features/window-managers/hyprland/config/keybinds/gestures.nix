{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = {
        gestures = {
          workspace_swipe = 1;
          workspace_swipe_touch = true;
          workspace_swipe_fingers = 3;
          workspace_swipe_forever = true;
          workspace_swipe_direction_lock = false;
        };
      };
    };
  };
}
