{config, lib, ...}:
let
  fileManager = "thunar.desktop";
  textEditor = "pluma.desktop";
  documentReader = "atril.desktop";
  mediaPlayer = "vlc.desktop";
  browser = "firefox.desktop";
  imageViewer = "org.xfce.ristretto.desktop";
  archiver = "org.gnome.FileRoller.desktop";
in
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
          "inode/directory" = ["${fileManager}"]; # Directories
          "text/plain" = ["${textEditor}"]; # Plain text
          "text/x-markdown" = ["${textEditor}"]; # Any text files
          "text/x-tex" = ["${textEditor}"]; # Any text files
          "text/x-python" = ["${textEditor}"]; # Any text files
          "text/x-ruby" = ["${textEditor}"]; # Any text files
          "text/x-readme" = ["${textEditor}"]; # Any text files
          "text/x-java" = ["${textEditor}"]; # Any text files
          "application/x-shellscript" = ["${textEditor}"]; # Any text files
          "application/xml" = ["${textEditor}"]; # Any text files
          "inode/x-empty" = ["${textEditor}"]; # Any text files
          "application/pdf" = ["${documentReader}"]; # .pdf
          "image/vnd.djvu" = ["${documentReader}"]; # .pdf
          "application/zip" = ["${archiver}"];
          "video/ogg" = ["${mediaPlayer}"];
          "video/x-msvideo" = ["${mediaPlayer}"];
          "video/mpeg" = ["${mediaPlayer}"];
          "video/quicktime" = ["${mediaPlayer}"];
          "video/webm" = ["${mediaPlayer}"];
          "video/x-flv" = ["${mediaPlayer}"];
          "video/mp4" = ["${mediaPlayer}"];
          "video/dv" = ["${mediaPlayer}"];
          "video/mkv" = ["${mediaPlayer}"];
          "video/3gp" = ["${mediaPlayer}"];
          "video/3gpp" = ["${mediaPlayer}"];
          "video/3gpp2" = ["${mediaPlayer}"];
          "video/mp2t" = ["${mediaPlayer}"];
          "video/msvideo" = ["${mediaPlayer}"];
          "video/x-avi" = ["${mediaPlayer}"];
          "video/x-anim" = ["${mediaPlayer}"];
          "video/x-flc" = ["${mediaPlayer}"];
          "video/x-fli" = ["${mediaPlayer}"];
          "video/x-matroska" = ["${mediaPlayer}"];
          "video/x-mpeg" = ["${mediaPlayer}"];
          "video/x-ms-asf" = ["${mediaPlayer}"];
          "video/x-ms-wmv" = ["${mediaPlayer}"];
          "video/x-nsv" = ["${mediaPlayer}"];
          "video/x-ogm+ogg" = ["${mediaPlayer}"];
          "video/mp4v-es" = ["${mediaPlayer}"];
          "audio/mp3" = ["${mediaPlayer}"];
          "audio/mp4" = ["${mediaPlayer}"];
          "audio/amr" = ["${mediaPlayer}"];
          "audio/mpeg2" = ["${mediaPlayer}"];
          "audio/mpeg3" = ["${mediaPlayer}"];
          "audio/mpegurl" = ["${mediaPlayer}"];
          "audio/mpg" = ["${mediaPlayer}"];
          "audio/x-mpg" = ["${mediaPlayer}"];
          "audio/aac" = ["${mediaPlayer}"];
          "audio/opus" = ["${mediaPlayer}"];
          "audio/x-aac" = ["${mediaPlayer}"];
          "audio/vnd.dolby.heaac.1" = ["${mediaPlayer}"];
          "audio/vnd.dolby.heaac.2" = ["${mediaPlayer}"];
          "audio/amr-wb" = ["${mediaPlayer}"];
          "audio/mpeg" = ["${mediaPlayer}"];
          "audio/aiff" = ["${mediaPlayer}"];
          "audio/x-aiff" = ["${mediaPlayer}"];
          "audio/webm" = ["${mediaPlayer}"];
          "audio/m4a" = ["${mediaPlayer}"];
          "audio/mp1" = ["${mediaPlayer}"];
          "audio/mp2" = ["${mediaPlayer}"];
          "audio/x-mp1" = ["${mediaPlayer}"];
          "audio/x-mp2" = ["${mediaPlayer}"];
          "audio/x-m4a" = ["${mediaPlayer}"];
          "audio/x-matroska" = ["${mediaPlayer}"];
          "audio/x-mp3" = ["${mediaPlayer}"];
          "audio/x-mpeg" = ["${mediaPlayer}"];
          "audio/x-mpegurl" = ["${mediaPlayer}"];
          "audio/x-ms-asf" = ["${mediaPlayer}"];
          "audio/x-ms-asx" = ["${mediaPlayer}"];
          "audio/x-ms-wax" = ["${mediaPlayer}"];
          "audio/x-pn-aiff" = ["${mediaPlayer}"];
          "audio/x-pn-au" = ["${mediaPlayer}"];
          "audio/x-pn-realaudio" = ["${mediaPlayer}"];
          "audio/x-pn-realaudio-plugin" = ["${mediaPlayer}"];
          "audio/x-pn-wav" = ["${mediaPlayer}"];
          "audio/x-pn-windows-acm" = ["${mediaPlayer}"];
          "audio/x-real-audio" = ["${mediaPlayer}"];
          "audio/x-scpls" = ["${mediaPlayer}"];
          "audio/x-vorbis+ogg" = ["${mediaPlayer}"];
          "audio/x-wav" = ["${mediaPlayer}"];
          "audio/x-flac" = ["${mediaPlayer}"];
          "application/x-extension-mp4" = ["${mediaPlayer}"];
          "application/x-flac" = ["${mediaPlayer}"];
          "application/x-matroska" = ["${mediaPlayer}"];
          "application/x-shockwave-flash" = ["${mediaPlayer}"];
          "application/x-flash-video" = ["${mediaPlayer}"];
          "x-content/audio-cdda" = ["${mediaPlayer}"];
          "x-content/audio-player" = ["${mediaPlayer}"];
          "x-content/video-dvd" = ["${mediaPlayer}"];
          "x-content/video-svcd" = ["${mediaPlayer}"];
          "x-content/video-vcd" = ["${mediaPlayer}"];
          "application/ogg" = ["${mediaPlayer}"];
          "x-scheme-handler/https" = ["${browser}"];
          "x-scheme-handler/http" = ["${browser}"]; # Links
          "x-scheme-handler/ftp" = ["${browser}"]; # Links
          "x-scheme-handler/mailto" = ["${browser}"]; # Links
          "image/bmp" = ["${imageViewer}"]; # Images
          "image/gif" = ["${imageViewer}"]; # Images
          "image/svg+xml" = ["${imageViewer}"]; # Images
          "image/tiff" = ["${imageViewer}"]; # Images
          "image/png" = ["${imageViewer}"];
          "image/jpeg" = ["${imageViewer}"];
          "image/jp2" = ["${imageViewer}"];
          "image/avif" = ["${imageViewer}"];
          "image/webp" = ["${imageViewer}"];
          "image/heif" = ["${imageViewer}"];
          "image/x-pixmap" = ["${imageViewer}"];
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
