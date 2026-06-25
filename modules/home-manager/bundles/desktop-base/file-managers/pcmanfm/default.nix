{...}: let
  desktopFile = "pcmanfm.desktop";
in {
  xdg.mimeApps.defaultApplications = {
    "inode/directory" = [desktopFile]; # Directories
  };
}
