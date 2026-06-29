{mpv, ...}: {
  programs.mpv = {
    enable = true;
    config = {
      profile = mpv.profile;
      vo = "gpu-next";
      hwdec = "auto";
      priority = "high";
      ytdl-format = "bestvideo+bestaudio";
      fs = "no";
    };
  };
}
