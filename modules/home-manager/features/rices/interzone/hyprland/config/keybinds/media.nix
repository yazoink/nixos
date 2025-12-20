{
  lib,
  config,
  osConfig,
  ...
}:
lib.mkMerge [
  {
    bind = [
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  }
  (lib.mkIf osConfig.myOptions.desktopTheme.interzone.swayosd.enable {
    bind = [
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      "$mainMod, F11, exec, swayosd-client --output-volume lower"
      "$mainMod, F12, exec, swayosd-client --output-volume raise"
      "$mainMod, F10, exec, swayosd-client --output-volume mute-toggle"
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
  (lib.mkIf (osConfig.myOptions.desktopTheme.rice.interzone.swayosd.enable == false) {
    bind = [
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioMicMute, exec, pamixer --default-source -t"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      "$mainMod, F11, exec, pamixer -d 5"
      "$mainMod, F12, exec, pamixer -i 5"
      "$mainMod, F10, exec, pamixer -t"
    ];
    binde = [
      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
    ];
    bindl = [
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
    ];
  })
]
