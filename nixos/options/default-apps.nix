{lib, ...}: {
  # ----- DEFAULT APPS ----- #
  #
  # The apps to install for specific uses. All of these are included in
  # the Desktop Base bundle except for Discord, which is in Desktop Full.

  options.myOptions.defaultApps = {
    fileManager = lib.mkOption {
      type = lib.types.str;
      default = "nemo";
      description = "Options: thunar, pcmanfm, nemo";
    };
    discordClient.command = lib.mkOption {
      type = lib.types.str;
      default = "vesktop";
      description = "Options: vesktop";
    };
    guiTextEditor.command = lib.mkOption {
      type = lib.types.str;
      default = "pluma";
      description = "Options: pluma";
    };
    documentReader.command = lib.mkOption {
      type = lib.types.str;
      default = "zathura";
      description = "Options: atril, zathura";
    };
    mediaPlayer.command = lib.mkOption {
      type = lib.types.str;
      default = "mpv";
      description = "Options: vlc, mpv, celluloid";
    };
    webBrowser.command = lib.mkOption {
      type = lib.types.str;
      default = "zen-twilight";
      description = "Options: firefox, zen-twilight, brave, librewolf";
    };
    imageViewer.command = lib.mkOption {
      type = lib.types.str;
      default = "imv";
      description = "Options: ristretto, imv";
    };
    terminal.command = lib.mkOption {
      type = lib.types.str;
      default = "foot";
      description = "Options: foot, footclient, alacritty, kitty";
    };
  };
}
