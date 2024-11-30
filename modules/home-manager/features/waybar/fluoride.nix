# depends on theme module for theming
{osConfig, lib, config, ...}:
{
  config = lib.mkIf (config.bundles.desktopBase.waybar.enable && osConfig.networking.hostName == "fluoride") {
    programs.waybar = {
      settings = {
        mainBar = {
          #modules-right = ["mpd"];
          "mpd".max-length = 50;
        };
      };
    };
  };
}
