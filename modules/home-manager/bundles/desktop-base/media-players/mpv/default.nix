{osConfig, ...}: {
  programs.mpv = {
    enable = true;
    config = {
      profile = osConfig.myOptions.bundles.desktopBase.mpv.profile;
      vo = "gpu-next";
      hwdec = "auto";
      priority = "high";
      ytdl-format = "bestvideo+bestaudio";
      fs = "no";
    };
  };
}
