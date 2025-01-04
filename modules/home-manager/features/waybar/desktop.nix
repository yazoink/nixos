# depends on theme module for theming
{osConfig, lib, config, ...}:
{
  config = lib.mkIf (config.bundles.desktopBase.waybar.enable && osConfig.myOptions.hardwareFeatures.laptop.enable == false) {
    programs.waybar = {
      settings = {
        mainBar = {
          modules-right = [
            #"mpd"
            "idle_inhibitor"
          ] ++ (if config.bundles.desktopBase.swaync.enable 
            then ["custom/notification" "tray"]
            else ["tray"]);
          "mpd".max-length = 50;
        };
      };
    };
  };
}
