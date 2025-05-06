# depends on theme module for theming
{
  osConfig,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.bundles.desktopBase.waybar.enable && osConfig.myOptions.hardwareFeatures.laptop.enable) {
    programs.waybar = {
      settings = {
        waybar = {
          modules-right =
            [
              #"mpd"
              "tray"
              "wireplumber"
              "group/bat"
            ]
            ++ (
              if config.bundles.desktopBase.swaync.enable
              then ["idle_inhibitor" "custom/notification"]
              else ["idle_inhibitor"]
            );
          "group/bat" = {
            orientation = "horizontal";
            modules = [
              "battery"
              "backlight"
            ];
          };
          "wireplumber" = {
            format = "{icon}";
            tooltip-format = "{volume}%";
            format-muted = "";
            max-volume = 100;
            scroll-step = 1;
            on-click = "pavucontrol";
            on-click-middle = "amixer -D pipewire set Master toggle";
            on-click-right = "amixer -D pipewire set Master toggle";
            format-icons = [
              ""
              ""
              ""
            ];
          };
          "battery" = {
            bat = osConfig.myOptions.hardwareFeatures.laptop.batteryName;
            interval = 60;
            format = "{icon}";
            tooltip-format = "{capacity}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
          };
          "backlight" = {
            scroll-step = 1;
            format-icons = [" " ""];
            # format = " ";
            tooltip-format = "{percent}%";
            on-scroll-down = "brightnessctl -s set 1%-";
            on-scroll-up = "brightnessctl -s set +1%";
          };
          "mpris".dynamic-len = 25;
          "mpd".max-length = 25;
        };
      };
    };
  };
}
