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
          "application/pdf" = ["firefox.desktop"]; # .pdf
          "application/zip" = ["org.gnome.FileRoller.desktop"];
          "text/*" = ["org.xfce.mousepad.desktop"]; # Any text files
          "video/*" = ["mpv.desktop"]; # Any video files
          "x-scheme-handler/https" = ["firefox.desktop"]; # Links
          "x-scheme-handler/http" = ["firefox.desktop"]; # Links
          "x-scheme-handler/mailto" = ["firefox.desktop"]; # Links
          "image/*" = ["org.xfce.ristretto.desktop"]; # Images
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
