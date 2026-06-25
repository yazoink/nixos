{...}: let
  desktopFile = "nemo.desktop";
in {
  xdg.mimeApps.defaultApplications = {
    "inode/directory" = [desktopFile]; # Directories
  };
}
