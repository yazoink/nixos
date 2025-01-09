{config, lib, osConfig, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && (osConfig.myOptions.defaultApps.terminal.command == "foot" || osConfig.myOptions.defaultApps.terminal.command == "footclient")) {
    programs.foot = {
      enable = true;
      server.enable = lib.mkIf (osConfig.myOptions.defaultApps.terminal.command == "footclient") true;
      settings = {
        main = {
          #pad = if osConfig.networking.hostName == "cyberia" then "16x16" else (if osConfig.networking.hostName == "fluoride" then "24x24" else "20x20");
          pad = "24x24";
          font = lib.mkForce "${config.stylix.fonts.monospace.name}:size=${toString config.stylix.fonts.sizes.terminal}, Terminus:size=12";
        };
        cursor = {
          style = "beam";
          blink = "yes";
        };
        url = {
          protocols = "http, https, ftp, ftps, file, gemini, gopher";
        };
        bell = {
          notify = "no";
        };
        scrollback = {
          lines = 500;
        };
      };
    };
  };
}
