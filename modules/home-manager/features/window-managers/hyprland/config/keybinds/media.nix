{
  lib,
  osConfig,
  config,
  ...
}: {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = lib.mkMerge [
        {
          bind = [
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPrev, exec, playerctl previous"
          ];
        }
        (lib.mkIf config.bundles.desktopBase.swayosd.enable {
          bind = [
            ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
            ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
            ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
            ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
          ];
          binde = [
            ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
          ];
          bindl = [
            ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
          ];
          bindr = [
            "CAPS, Caps_Lock, exec, swayosd-client --caps-lock"
          ];
        })
        (lib.mkIf (config.bundles.desktopBase.swayosd.enable == false) {
          bind = [
            ", XF86AudioMute, exec, pamixer -t"
            ", XF86AudioMicMute, exec, pamixer --default-source -t"
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
            ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
          ];
          binde = [
            ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          ];
          bindl = [
            ", XF86AudioLowerVolume, exec, pamixer -d 5"
          ];
        })
      ];
    };
  };
}
