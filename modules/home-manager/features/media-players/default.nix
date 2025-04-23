{lib, ...}: {
  imports = [
    ./vlc
    ./mpv
  ];
  options = {
    defaultApps.mediaPlayer.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
