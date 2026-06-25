{pkgs, ...}: let
  desktopFile = "pluma.desktop";
in {
  home.packages = [pkgs.pluma];
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [desktopFile];
    "text/x-markdown" = [desktopFile];
    "text/x-tex" = [desktopFile];
    "text/x-python" = [desktopFile];
    "text/x-ruby" = [desktopFile];
    "text/x-readme" = [desktopFile];
    "text/x-java" = [desktopFile];
    "application/x-shellscript" = [desktopFile];
    "application/xml" = [desktopFile];
    "inode/x-empty" = [desktopFile];
  };
}
