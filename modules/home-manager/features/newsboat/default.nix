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
        {
          tags = ["youtube"];
          url = "https://www.youtube.com/sleepdeprived";
        }
      ];
    };
  };
}
