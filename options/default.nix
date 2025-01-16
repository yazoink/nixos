#### Options ####
# To be enabled in ../nixos/hostname/default.nix
{lib, ...}: {
  options = {
    myOptions = {
      defaultApps = {
        fileManager = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "thunar";
            description = "options: thunar";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "thunar.desktop";
          };
        };
        discordClient = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "vesktop";
            description = "options: vesktop, abaddon, dissent";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "vesktop.desktop";
          };
        };
        guiTextEditor = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "pluma";
            description = "options: pluma, codium";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "pluma.desktop";
          };
        };
        documentReader = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "atril";
            description = "options: atril";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "atril.desktop";
          };
        };
        mediaPlayer = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "vlc";
            description = "options: vlc";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "vlc.desktop";
          };
        };
        webBrowser = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "firefox";
            description = "options: firefox";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "firefox.desktop";
          };
        };
        imageViewer = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "ristretto";
            description = "options: ristretto";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "org.xfce.ristretto.desktop";
          };
        };
        archiver = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "file-roller";
            description = "options: file-roller";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "org.gnome.FileRoller.desktop";
          };
        };
        terminal = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "footclient";
            description = "options: foot, footclient";
          };
          desktopFile = lib.mkOption {
            type = lib.types.str;
            default = "footclient.desktop";
          };
        };
      };
      userAccount = {
        username = lib.mkOption {
          type = lib.types.str;
          default = "gene";
        };
      };
      desktopTheme = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "caroline";
          description = "options: caroline, carob, tarot, manuscript, rosepine, wizard, atelier-savanna, blood-rust, embers, mountain, spirit, swamp, terracotta, twilight";
        };
        terminalPadding = lib.mkOption {
          type = lib.types.number;
          default = 24;
        };
        fonts = {
          terminal = {
            name = lib.mkOption {
              type = lib.types.str;
              default = "Bm437 NEC APC3 8x16";
              description = "options: Bm437 NEC APC3 8x16, GeistMono Nerd Font, Iosevka Nerd Font, ZedMono Nerd Font";
            };
            size = lib.mkOption {
              type = lib.types.number;
              default = 12;
            };
          };
          desktop = {
            name = lib.mkOption {
              type = lib.types.str;
              default = "Rubik";
              description = "options: Rubik, SF Pro Display";
            };
            size = lib.mkOption {
              type = lib.types.number;
              default = 11;
            };
          };
        };
        wallpaper = lib.mkOption {
          type = lib.types.path;
          description = "path to wallpaper";
        };
        firefoxCss = {
          shyfox = {
            enable = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            wallpaper = lib.mkOption {
              type = lib.types.path;
            };
          };
          firefoxUiFix = {
            enable = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
          };
          anotherOneline = {
            enable = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
          };
          oneLineFirefox = {
            enable = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
          };
        };
        sddm = {
          scale = lib.mkOption {
            type = lib.types.number;
            default = 1;
            description = "scale for the theme";
          };
          wallpaper = lib.mkOption {
            type = lib.types.path;
          };
        };
      };
      bundles = {
        base = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          starshipFormat = lib.mkOption {
            type = lib.types.number;
            default = 1;
            description = "Theme/format for Starship (1-2).";
          };
        };
        desktopBase = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          windowManager = lib.mkOption {
            type = lib.types.str;
            default = "hyprland";
            description = "options: hyprland, sway";
          };
          displayManager = lib.mkOption {
            type = lib.types.str;
            default = "sddm";
            description = "options: sddm, regreet";
          };
        };
        desktopFull = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          vesktop = {
            bloat = lib.mkOption {
              type = lib.types.bool;
              default = true;
              description = "setting to false installs less plugins";
            };
          };
        };
      };
      features = {
        etterna.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        eduke32.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        superTuxKart.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        gamescope.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        prismlauncher.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        retroarch.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        osu.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        gzdoom.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        spaceCadetPinball.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        pychess.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        knavalbattle.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        minetest.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ollama.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        steam.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        virtManager.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        virtualbox.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };
      hardwareFeatures = {
        h264ify.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        diskBurner.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        ssd.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        laptop = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          touchpadScrollFactor = lib.mkOption {
            type = lib.types.number;
            default = 1;
          };
          batteryName = lib.mkOption {
            type = lib.types.str;
            default = "BAT0";
          };
        };
      };
    };
  };
}
