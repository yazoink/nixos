{pkgs, ...}: let
  desktopFile = "org.xfce.ristretto.desktop";
in {
  home.packages = [pkgs.xfce.ristretto];
  xdg.mimeApps.defaultApplications = {
    "image/bmp" = [desktopFile];
    "image/gif" = [desktopFile];
    "image/svg+xml" = [desktopFile];
    "image/tiff" = [desktopFile];
    "image/png" = [desktopFile];
    "image/jpeg" = [desktopFile];
    "image/jp2" = [desktopFile];
    "image/avif" = [desktopFile];
    "image/webp" = [desktopFile];
    "image/heif" = [desktopFile];
    "image/x-pixmap" = [desktopFile];
  };
}
