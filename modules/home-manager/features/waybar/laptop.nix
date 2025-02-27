# depends on theme module for theming
{osConfig, lib, config, ...}:
{
  config = lib.mkIf (config.bundles.desktopBase.waybar.enable && osConfig.myOptions.hardwareFeatures.laptop.enable) {
    programs.waybar = {
      settings = {
        waybar = {
          modules-right = [
            #"mpd"
            "wireplumber"
            "group/bat"
            "tray"
          ] ++ (if config.bundles.desktopBase.swaync.enable 
            then ["idle_inhibitor" "custom/notification"]
            else ["idle_inhibitor"]);
          "group/bat" = {
            orientation = "horizontal";
            modules = [
              "battery"
              "backlight"
            ];
          };
          "wireplumber" = {
            format = "{icon} {volume}%";
            format-muted = " {volume}%";
            max-volume = 100;
            scroll-step = 5;
            on-click = "pavucontrol";
            format-icons = [
              ""
              ""
              ""
            ];
          };
          "battery" = {
            bat = osConfig.myOptions.hardwareFeatures.laptop.batteryName;
            interval = 60;
            format = "{icon} {capacity}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
          };
          "backlight" = {
            scroll-step = 5;
            format = " {percent}%";
          };
          "mpris".dynamic-len = 25;
          "mpd".max-length = 25;
        };
      };
    };
  };
}
