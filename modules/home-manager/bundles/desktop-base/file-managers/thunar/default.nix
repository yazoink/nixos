{...}: let
  desktopFile = "thunar.desktop";
in {
  xdg.mimeApps.defaultApplications = {
    "inode/directory" = [desktopFile]; # Directories
  };
}
