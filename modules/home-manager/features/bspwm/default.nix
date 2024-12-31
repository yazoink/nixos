{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.windowManager.name == "bspwm") {
    xsession.windowManager.bspwm = {
      enable = true;
      alwaysResetDesktops = false;
      monitors = {
        LVDS-1 = [1 2 3 4 5 6 7 8 9 10];
      };
      startupPrograms = [
        "${lib.getExe pkgs.hsetroot} -cover ${osConfig.myOptions.desktopTheme.wallpaper}"
      ];
      settings = {
        border_width = 2;
        window_gap = 10;
        split_ratio = 0.52;
        focus_follows_pointer = true;
        pointer_modifier = "mod1";
        automatic_scheme = "spiral";
      };
    };
    services.sxhkd = {
      enable = true;
      keybindings = {
        "super + {_,shift + }{1-9,0}" = "bspc {desktop --focus,node --to-desktop} '{1,2,3,4,5,6,7,8,9,10}'";
        "super + q" = "bspc node -{k,c}";
        "super + Return" = "${lib.getExe pkgs.urxvt}";
        "super + p" = "${lib.getExe pkgs.rofi}";
        "super + shift + {q,r}" = "bspc {quit,wm -r}";
        "super + m" = "bspc desktop -l next";
        "XF86AudioRaiseVolume" = "pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "XF86AudioMute" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessUp" = "${lib.getExe pkgs.light} -A 5";
        "XF86MonBrightnessdown" = "${lib.getExe pkgs.light} -U 5";
        "XF86AudioPlay" = "playerctl play-pause";
        "XF86AudioNext" = "playerctl next";
        "XF86AudioPrev" = "playerctl previous";
      };
    };
  };
}
