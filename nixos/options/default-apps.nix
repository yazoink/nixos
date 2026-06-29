{lib, ...}: {
  options.myOptions.defaultApps = {
    fileManager = lib.mkOption {
      type = lib.types.str;
      default = "nemo";
      description = "Options: thunar, pcmanfm, nemo";
    };
    discordClient = lib.mkOption {
      type = lib.types.str;
      default = "vesktop";
      description = "Options: vesktop";
    };
    guiTextEditor = lib.mkOption {
      type = lib.types.str;
      default = "featherpad";
      description = "Options: pluma, gedit, featherpad, mousepad";
    };
    documentReader = lib.mkOption {
      type = lib.types.str;
      default = "zathura";
      description = "Options: atril, zathura";
    };
    mediaPlayer = lib.mkOption {
      type = lib.types.str;
      default = "mpv";
      description = "Options: vlc, mpv, celluloid";
    };
    webBrowser = lib.mkOption {
      type = lib.types.str;
      default = "zen-twilight";
      description = "Options: firefox, zen-twilight, brave, librewolf";
    };
    imageViewer = lib.mkOption {
      type = lib.types.str;
      default = "imv";
      description = "Options: ristretto, imv";
    };
    terminal = lib.mkOption {
      type = lib.types.str;
      default = "foot";
      description = "Options: foot, footclient, alacritty, kitty";
    };
  };
}
