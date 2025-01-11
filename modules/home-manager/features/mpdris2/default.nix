{lib, osConfig, ...}:
{
  config = lib.mkIf osConfig.myOptions.bundles.desktopFull.mpd.enable {
    services.mpdris2 = {
      enable = true;
      notifications = true;
      host = osConfig.services.mpd.network.listenAddress;
      port = osConfig.services.mpd.network.port;
      musicDirectory = osConfig.services.mpd.musicDirectory;
    };
  };
}
