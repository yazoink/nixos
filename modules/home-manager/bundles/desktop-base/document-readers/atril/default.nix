{pkgs, ...}: let
  desktopFile = "atril.desktop";
in {
  home.packages = [pkgs.mate.atril];
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [desktopFile];
    "image/vnd.djvu" = [desktopFile];
    "application/epub+zip" = [desktopFile];
  };
}
