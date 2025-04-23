{lib, ...}: {
  imports = [
    ./atril
  ];
  options = {
    defaultApps.documentReader.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
