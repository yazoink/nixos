{lib, osConfig, ...}:
{
  config = lib.mkIf osConfig.bundles.desktopFull.mpd.enable {
    services.mpdris2 = {
      enable = true;
      notifications = true;
      mpd = {
        host = osConfig.services.mpd.network.listenAddress;
        port = osConfig.services.mpd.network.port;
        musicDirectory = osConfig.services.mpd.musicDirectory;
      };
    };
  };
}
