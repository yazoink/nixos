{lib, ...}: {
  imports = [
    ./pluma
    ./vscode
  ];
  options = {
    defaultApps.guiTextEditor.desktopFile = lib.mkOption {
      type = lib.types.str;
    };
  };
}
