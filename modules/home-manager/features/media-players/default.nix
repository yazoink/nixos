{lib, ...}: {
  imports = [
    ./vlc
    ./mpv
    ./celluloid
  ];
  options = {
    defaultApps.mediaPlayer.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
