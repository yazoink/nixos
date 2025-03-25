{
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopFull.newsboat.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.newsboat.enable {
    programs.newsboat = {
      enable = true;
      browser = "firefox";
      urls = [
        {
          tags = ["technology" "blog"];
          url = "https://yazo.ink/rss.php";
        }
        {
          tags = ["technology" "blog"];
          url = "https://blog.ahwx.org/rss";
        }
        {
          tags = ["technology" "blog"];
          url = "https://3tnl.dev/index.xml";
        }
        {
          tags = ["technology" "blog"];
          url = "https://brycevandegrift.xyz//rss.xml";
        }
        {
          tags = ["technology" "blog"];
          url = "https://svw.au/index.xml";
        }
        {
          tags = ["technology" "ricing"];
          url = "https://deskto.ps/rss";
        }
        {
          tags = ["technology" "nix"];
          url = "https://nixos.org/blog/announcements-rss.xml";
        }
        # enter in console on yt channel page:
        # window["ytInitialData"].metadata.channelMetadataRenderer.rssUrl
        {
          tags = ["youtube"]; # sleep deprived
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5qqBFOKTNAzIyE4g3SvuwQ";
        }
        {
          tags = ["youtube"]; # schlatt
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2mP7il3YV7TxM_3m6U0bwA";
        }
      ];
    };
  };
}
