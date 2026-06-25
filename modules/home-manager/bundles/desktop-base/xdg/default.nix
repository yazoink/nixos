{...}: {
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
        "application/vnd.oasis.opendocument.text" = ["writer.desktop"];
        "application/vnd.oasis.opendocument.text-template " = ["writer.desktop"];
        "application/vnd.oasis.opendocument.spreadsheet" = ["calc.desktop"];
        "application/vnd.oasis.opendocument.spreadsheet-template " = ["calc.desktop"];
        "application/vnd.oasis.opendocument.presentation" = ["impress.desktop"];
        "application/vnd.oasis.opendocument.presentation-template" = ["impress.desktop"];
        "application/vnd.oasis.opendocument.graphics" = ["draw.desktop"];
        "application/vnd.oasis.opendocument.graphics-template" = ["draw.desktop"];
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
}
