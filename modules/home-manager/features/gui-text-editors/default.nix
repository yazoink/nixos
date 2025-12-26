{lib, ...}: {
  imports = [
    ./pluma
  ];
  options = {
    defaultApps.guiTextEditor.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
