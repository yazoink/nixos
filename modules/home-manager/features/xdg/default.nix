{config, lib, ...}:
{
  options = {
    bundles.desktopBase.xdg.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.xdg.enable {
    home = {
      file = {
        ".config/user-dirs.dirs".text = ''
          XDG_DESKTOP_DIR="$HOME/desk"
          XDG_DOWNLOAD_DIR="$HOME/dl"
          XDG_TEMPLATES_DIR="$HOME/tmpl"
          XDG_PUBLICSHARE_DIR="$HOME/pub"
          XDG_DOCUMENTS_DIR="$HOME/doc"
          XDG_MUSIC_DIR="$HOME/mu"
          XDG_PICTURES_DIR="$HOME/pic"
          XDG_VIDEOS_DIR="$HOME/vid"
        '';
      };
    };
    xdg.configFile."mimeapps.list".force = true;
    xdg = {
      mimeApps = rec {
        enable = true;
        associations.added = defaultApplications;
        defaultApplications = {
          "inode/directory" = ["thunar.desktop"]; # Directories
          "text/plain" = ["org.xfce.mousepad.desktop"]; # Plain text
          "text/*" = ["org.xfce.mousepad.desktop"]; # Any text files
          "application/pdf" = ["org.gnome.Evince.desktop"]; # .pdf
          "image/vnd.djvu" = ["org.gnome.Evince.desktop"]; # .pdf
          "application/zip" = ["org.gnome.FileRoller.desktop"];
          "video/ogg" = ["vlc.desktop"];
          "video/x-msvideo" = ["vlc.desktop"];
          "video/mpeg" = ["vlc.desktop"];
          "video/quicktime" = ["vlc.desktop"];
          "video/webm" = ["vlc.desktop"];
          "video/x-flv" = ["vlc.desktop"];
          "video/mp4" = ["vlc.desktop"];
          "audio/mp3" = ["vlc.desktop"];
          "audio/mp4" = ["vlc.desktop"];
          "audio/amr" = ["vlc.desktop"];
          "audio/amr-wb" = ["vlc.desktop"];
          "audio/mpeg" = ["vlc.desktop"];
          "audio/webm" = ["vlc.desktop"];
          "audio/x-m4a" = ["vlc.desktop"];
          "audio/x-matroska" = ["vlc.desktop"];
          "audio/x-mp3" = ["vlc.desktop"];
          "audio/x-mpeg" = ["vlc.desktop"];
          "audio/x-mpegurl" = ["vlc.desktop"];
          "audio/x-ms-asf" = ["vlc.desktop"];
          "audio/x-ms-asx" = ["vlc.desktop"];
          "audio/x-ms-wax" = ["vlc.desktop"];
          "audio/x-pn-aiff" = ["vlc.desktop"];
          "audio/x-pn-au" = ["vlc.desktop"];
          "audio/x-pn-realaudio" = ["vlc.desktop"];
          "audio/x-pn-realaudio-plugin" = ["vlc.desktop"];
          "audio/x-pn-wav" = ["vlc.desktop"];
          "audio/x-pn-windows-acm" = ["vlc.desktop"];
          "audio/x-real-audio" = ["vlc.desktop"];
          "audio/x-scpls" = ["vlc.desktop"];
          "audio/x-vorbis+ogg" = ["vlc.desktop"];
          "audio/x-wav+ogg" = ["vlc.desktop"];
          "audio/x-flac" = ["vlc.desktop"];
          "application/x-extension-mp4" = ["vlc.desktop"];
          "application/x-flac" = ["vlc.desktop"];
          "application/x-matroska" = ["vlc.desktop"];
          "application/x-shockwave-flash" = ["vlc.desktop"];
          "application/x-flash-video" = ["vlc.desktop"];
          "application/ogg" = ["vlc.desktop"];
          "x-scheme-handler/https" = ["firefox.desktop"];
          "x-scheme-handler/http" = ["firefox.desktop"]; # Links
          "x-scheme-handler/mailto" = ["firefox.desktop"]; # Links
          "image/bmp" = ["org.xfce.ristretto.desktop"]; # Images
          "image/gif" = ["org.xfce.ristretto.desktop"]; # Images
          "image/svg+xml" = ["org.xfce.ristretto.desktop"]; # Images
          "image/tiff" = ["org.xfce.ristretto.desktop"]; # Images
          "image/png" = ["org.xfce.ristretto.desktop"];
          "image/jpeg" = ["org.xfce.ristretto.desktop"];
        };
      };
      desktopEntries = {
        qt5ct = {
          name = "Qt5 Settings";
          comment = "Qt5 Configuration Tool";
          exec = "qt5ct";
          terminal = false;
          type = "Application";
          categories = ["Settings" "DesktopSettings" "Qt"];
          noDisplay = true;
        };
        qt6ct = {
          name = "Qt6 Settings";
          comment = "Qt6 Configuration Tool";
          exec = "qt6ct";
          terminal = false;
          type = "Application";
          categories = ["Settings" "DesktopSettings" "Qt"];
          noDisplay = true;
        };
        kvantummanager = {
          name = "Kvantum Manager";
          comment = "A simple GUI for installing, selecting and manipulating Kvantum themes";
          exec = "kvantummanager";
          terminal = false;
          type = "Application";
          categories = ["Settings" "DesktopSettings" "Qt"];
          noDisplay = true;
        };
      };
    };
  };
}
