
{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopFull.ytDlp.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.ytDlp.enable {
    programs.yt-dlp = {
      enable = true;

      settings = {
        format = "'bestvideo+bestaudio/best'";
        # Metadata
        add-metadata = true;
        embed-subs = true;
        xattrs = true;
        # Subtitles
        write-sub = true;
        sub-format = "best";
        sub-lang = "en";
        # Downloader
        downloader = "aria2c";
        downloader-args = "aria2c:'--async-dns=false --max-download-limit=6M --min-split-size=1M --max-connection-per-server=4 --split=4'";
        # Other
        no-overwrites = true;
        no-call-home = true;
      };
    };

    home.packages = with pkgs; [
      aria2
      rtmpdump
      ffmpeg
    ];
  };
}
