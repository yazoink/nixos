{config, lib, osConfig, ...}:
{
  options = {
    bundles.desktopBase.foot.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.foot.enable {
    programs.foot = {
      enable = true;
      #server.enable = true;
      settings = {
        main = {
          pad = if osConfig.networking.hostName == "cyberia" then "15x15" else (if osConfig.networking.hostName == "fluoride" then "24x24" else "20x20");
          font = "${config.stylix.fonts.monospace.name}:size=11, Terminus:size=12";
        };
        cursor = {
          style = "beam";
          blink = "yes";
        };
        url = {
          protocols = "http, https, ftp, ftps, file, gemini, gopher";
        };
      };
    };
  };
}
