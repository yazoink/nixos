# depends on theme module for theming
{osConfig, lib, config, ...}:
{
  config = lib.mkIf (config.bundles.desktopBase.waybar.enable && osConfig.myOptions.hardwareFeatures.laptop.enable == false) {
    programs.waybar = {
      settings = {
        waybar = {
          modules-right = [
            #"mpd"
            "tray"
          ] ++ (if config.bundles.desktopBase.swaync.enable 
            then ["idle_inhibitor" "custom/notification"]
            else ["idle_inhibitor"]);
          "mpd".max-length = 50;
        };
      };
    };
  };
}
