# buggy with hyprbars
{
  pkgs,
  config,
  lib,
  osConfig,
  inputs,
  ...
}: {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    wayland.windowManager.hyprland = {
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
      ];
      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(${config.stylix.base16Scheme.base00})";
          workspace_method = "first 1";
          enable_gesture = true;
          gesture_fingers = 3;
        };
      };
      bind = [
        "$mainMod, Tab, hyprexpo:expo, toggle"
      ];
    };
  };
}
