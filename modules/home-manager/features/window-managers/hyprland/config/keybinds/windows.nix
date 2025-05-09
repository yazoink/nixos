{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = {
        bind = [
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, E, exit,"
          "$mainMod, F, togglefloating,"
          "$mainMod SHIFT, P, pseudo,"
          "$mainMod, X, pin,"
          "$mainMod, M, fullscreen, 1"
          "$mainMod SHIFT, M, fullscreen, 0"

          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, down, movefocus, d"
          "$mainMod, up, movefocus, u"

          "$mainMod SHIFT, left, movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, down, movewindow, d"
          "$mainMod SHIFT, up, movewindow, u"
        ];
        binde = [
          "$mainMod, Minus, splitratio, -0.1"
          "$mainMod, Equal, splitratio, 0.1"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
      };
    };
  };
}
