{config, ...}: let
  desktopFile = "imv-dir.desktop";
in {
  programs.imv = {
    enable = true;
    settings = {
      options = {
        fullscreen = false;
        width = 640;
        height = 480;
        overlay = false;
        overlay_font = "sans:${builtins.toString config.gtk.font.size}";
        scaling_mode = "full";
      };
      aliases.x = "close";
    };
  };
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
