{...}: {
  bind = [
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioPause, exec, playerctl play-pause"
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPrev, exec, playerctl previous"
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
}
