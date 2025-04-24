#### ----- Options ----- ####
# To be set in ../nixos/<hostname>/options.nix
{
  lib,
  config,
  ...
}: rec {
  options = {
    myOptions = {
      # ----- BUNDLES ----- #
      #
      # These are bundles of modules and packages that suit different system
      # configurations.
      #
      #
      # Base: The base modules and packages needed to get a working console.
      #
      # Desktop Base: The modules and packages for a working console + basic
      # desktop. It provides a file manager, terminal, media player, document
      # reader, image viewer, text editor, and web browser but no extra apps.
      #
      # Desktop Full: The modules and packages needed for a working console and
      # fully-featured desktop.

      bundles = {
        base = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          starshipFormat = lib.mkOption {
            type = lib.types.number;
            default = 2;
            description = ''
              Theme/format for Starship prompt.

              Options:
                1: Best for bitmap fonts
                2: Best for regulat fonts
                3 (or any other number): default
            '';
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
            description = "Options: hyprland, sway";
          };
          displayManager = lib.mkOption {
            type = lib.types.str;
            default = "sddm";
            description = "Options: sddm, regreet";
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
              description = "Setting to false installs less plugins.";
            };
          };
        };
      };

      # ----- DEFAULT APPS ----- #
      #
      # The apps to install for specific uses. All of these are included in
      # the Desktop Base bundle except for Discord, which is in Desktop Full.

      defaultApps = {
        fileManager = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "nemo";
            description = "Options: thunar, pcmanfm, nemo";
          };
        };
        discordClient = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "vesktop";
            description = "Options: vesktop, abaddon, dissent, legcord";
          };
        };
        guiTextEditor = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "pluma";
            description = "Options: pluma, codium";
          };
        };
        documentReader = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "atril";
            description = "Options: atril, zathura";
          };
        };
        mediaPlayer = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "vlc";
            description = "Options: vlc, mpv, celluloid";
          };
        };
        webBrowser = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "firefox";
            description = "Options: firefox, zen, brave, librewolf";
          };
        };
        imageViewer = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "imv";
            description = "Options: ristretto, imv";
          };
        };
        terminal = {
          command = lib.mkOption {
            type = lib.types.str;
            default = "kitty";
            description = "Options: foot, footclient, alacritty, kitty";
          };
        };
      };

      # ----- USER ACCOUNT ----- #
      #
      # Options for the user account.

      userAccount = {
        username = lib.mkOption {
          type = lib.types.str;
          default = "gene";
        };
      };

      # ----- DESKTOP THEME ----- #
      #
      # Theming options for the desktop.

      desktopTheme = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "everblush";
          description = ''
            See nixos/modules/nixos/features/theme/themes for options.

            The the themes are named after their respective folders. Some also
            have image previews.
          '';
        };
        terminalPadding = lib.mkOption {
          type = lib.types.number;
          default = 24;
        };
        fonts = {
          terminal = {
            name = lib.mkOption {
              type = lib.types.str;
              default = "Iosevka Nerd Font";
              description = ''
                See nixos/modules/nixos/features/theme/fonts/terminal for
                options.

                The enter the actual name of the font, not the folder name. The
                actual names can be found inside the default.nix files.
              '';
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
              description = ''
                See nixos/modules/nixos/features/theme/fonts/desktop for
                options.

                The enter the actual name of the font, not the folder name. The
                actual names can be found inside the default.nix files.
              '';
            };
            size = lib.mkOption {
              type = lib.types.number;
              default = 11;
            };
          };
        };
        wallpaper = {
          type = lib.mkOption {
            type = lib.types.str;
            description = "Options: image, color";
            default = "image";
          };
          image = {
            fillType = lib.mkOption {
              type = lib.types.str;
              description = "Options: fill, tile";
              default = "fill";
            };
            path = lib.mkOption {
              type = lib.types.path;
              description = ''
                Path to wallpaper. Required for stylix, even if color is set.
              '';
              default = ../wallpapers/flowers-1.jpg;
            };
          };
          color = {
            hex = lib.mkOption {
              type = lib.types.str;
              default = "000000";
            };
          };
        };
        sddm = {
          scale = lib.mkOption {
            type = lib.types.number;
            default = 1;
            description = "Scale for the theme.";
          };
          wallpaper = lib.mkOption {
            type = lib.types.path;
            default = config.myOptions.desktopTheme.wallpaper.image.path;
          };
        };
      };

      # ----- FEATURES ----- #
      #
      # Miscellaneous modules and packages not in any bundle to be freely
      # enabled.
      #
      # Most, if not all require at least the Desktop Base bundle to be
      # enabled.

      features = {
        etterna.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        lutgen.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        wine.enable = lib.mkOption {
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

      # ----- HARDWARE FEATURES ----- #
      #
      # Miscellaneous modules and packages not included in any bundles -- for
      # specific hardware.
      #
      # h264-ify: Browser extension for better YouTube playback on old
      # hardware.
      #
      # Disk Burner: Installs CD/DVD burning/ripping software.
      #
      # SSD: Enables fstrim for solid state drives.
      #
      # Laptop: Enables laptop-specific features.
      #
      # - Hyprland Touchpad Scroll Factor: tweak the speed of scrolling with
      #   the touchpad in Hyprland. Less is slower.
      #
      # - Battery Name: Name of the battery under /sys/class/power_supply

      hardwareFeatures = {
        bootloader = {
          type = lib.mkOption {
            type = lib.types.str;
            default = "uefi";
            description = "Options: uefi, legacy";
          };
          legacy = {
            bootDrive = lib.mkOption {
              type = lib.types.str;
              default = "/dev/sda";
              description = "Location of the boot drive.";
            };
            customResolution = {
              enable = lib.mkOption {
                type = lib.types.bool;
                default = false;
                description = "Only set this if you definitely have the right value.";
              };
              resolution = lib.mkOption {
                type = lib.types.str;
                default = "1024x768";
              };
            };
          };
        };
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
          hyprlandTouchpadScrollFactor = lib.mkOption {
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
