# depends on theme module for theming
{osConfig, lib, config, ...}:
{
  config = lib.mkIf (config.bundles.desktopBase.waybar.enable && osConfig.networking.hostName == "cyberia") {
    programs.waybar = {
      settings = {
        mainBar = {
          modules-right = [
            #"mpd"
            "wireplumber"
            "group/bat"
            "idle_inhibitor"
            "tray"
          ];
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
              ""
              ""
              ""
            ];
          };
          "battery" = {
            bat = "BAT0";
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
