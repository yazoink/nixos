{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = {
        bind = [
          "$mainMod, Return, exec, $terminal"
          "$mainMod, W, exec, $browser"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, P, exec, $menu"
          "$mainMod, R, exec, $menu"
          "$mainMod SHIFT, B, exec, bash ${../../../scripts/ironbar.sh}"
          "$mainMod, N, exec, $terminal -e ncmpcpp"
          "$mainMod SHIFT, O, exec, rofi -show window"
          "$mainMod, S, exec, $screenshot"
          "$mainMod CTRL, S, exec, $screenshotFullscreen"
          "$mainMod CTRL, L, exec, $lock"
          "$mainMod, C, exec, $colorPicker"
          "$mainMod, R, exec, $screenRecorder"
          "$mainMod, U, exec, mpc update && notify-send 'MPD' 'Library updated'"
          "$mainMod SHIFT, R, exec, hyprctl reload && notify-send \"Hyprland\" \"Config reloaded.\""
          "$mainMod SHIFT, W, exec, $wallpaper"
          "$mainMod SHIFT, V, exec, ${../../../scripts/virsh-net-toggle.sh}"
          "$mainMod SHIFT, D, exec, ${../../../scripts/dnd.sh}"
          "$mainMod SHIFT, F, exec, ${../../../scripts/restart-foot-server.sh}"
          ", XF86Lock, exec, $lock"
          ", code:107, exec, $screenshot"
        ];
      };
    };
  };
}
