{lib, ...}: {
  imports = [
    ./atril
    ./zathura
  ];
  options = {
    defaultApps.documentReader.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
