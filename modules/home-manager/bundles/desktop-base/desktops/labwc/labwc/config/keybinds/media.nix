{...}: [
  # media keys
  {
    "@key" = "XF86AudioPlay";
    action = {
      "@name" = "Execute";
      "@command" = "playerctl play-pause";
    };
  }
  {
    "@key" = "XF86AudioPause";
    action = {
      "@name" = "Execute";
      "@command" = "playerctl play-pause";
    };
  }
  {
    "@key" = "XF86AudioNext";
    action = {
      "@name" = "Execute";
      "@command" = "playerctl next";
    };
  }
  {
    "@key" = "XF86AudioPrev";
    action = {
      "@name" = "Execute";
      "@command" = "playerctl previous";
    };
  }
  {
    "@key" = "XF86AudioMute";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --output-volume mute-toggle";
    };
  }
  {
    "@key" = "XF86AudioMicMute";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --input-volume mute-toggle";
    };
  }
  {
    "@key" = "XF86AudioRaiseVolume";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --output-volume raise";
    };
  }
  {
    "@key" = "XF86AudioLowerVolume";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --output-volume lower";
    };
  }
  {
    "@key" = "W-F12";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --output-volume raise";
    };
  }
  {
    "@key" = "W-F11";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --output-volume lower";
    };
  }
  {
    "@key" = "W-F10";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --output-volume mute-toggle";
    };
  }
  {
    "@key" = "XF86MonBrightnessDown";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --brightness lower";
    };
  }
  {
    "@key" = "XF86MonBrightnessUp";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --brightness raise";
    };
  }
  {
    "@key" = "Caps_Lock";
    action = {
      "@name" = "Execute";
      "@command" = "swayosd-client --caps-lock";
    };
  }
]
