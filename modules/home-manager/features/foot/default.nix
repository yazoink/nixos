{config, lib, ...}:
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
          pad = "24x24";
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
