{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.mediaPlayer.command == "mpv") {
    defaultApps.mediaPlayer.desktopFile = "mpv.desktop";
    programs.mpv = {
      enable = true;
      config = {
        profile = "gpu-hq";
        ytdl-format = "bestvideo+bestaudio";
        fs = "no";
      };
    };
  };
}
