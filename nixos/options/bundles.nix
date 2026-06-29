{
  lib,
  pkgs,
  ...
}: {
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

  options.myOptions.bundles = {
    base = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      ssh = {
        allowPasswordAuth = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Allow SSH authentication via password";
        };
        allowRootLogin = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Allow root login via SSH";
        };
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
      desktop = {
        colorscheme = lib.mkOption {
          type = lib.types.str;
          default = "paradise";
          description = "options: see modules/nixos/bundles/desktop-base/desktop/common/stylix/themes";
        };
        fonts = {
          desktop = {
            name = lib.mkOption {
              type = lib.types.str;
              default = "gabarito";
              description = "See nixos/modules/nixos/bundles/desktop-base/desktops/common/stylix/fonts/desktop for options.";
            };
            size = lib.mkOption {
              type = lib.types.number;
              default = 11;
            };
          };
          terminal = {
            name = lib.mkOption {
              type = lib.types.str;
              default = "aporetic-serif-mono";
              description = "See nixos/modules/nixos/bundles/desktop-base/desktops/common/stylix/fonts/terminal for options.";
            };
            size = lib.mkOption {
              type = lib.types.number;
              default = 12;
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
              default = pkgs.fetchurl {
                url = "https://raw.githubusercontent.com/yazoink/wallpapers/refs/heads/main/trees-and-leaves/andrei-lazarev-QtM-8j_1o3Q.jpg";
                hash = "";
              };
            };
          };
          color = {
            hex = lib.mkOption {
              type = lib.types.str;
              default = "000000";
            };
          };
        };
        terminalPadding = lib.mkOption {
          type = lib.types.number;
          default = 32;
        };
        windowManager = {
          name = lib.mkOption {
            type = lib.types.str;
            default = "labwc";
            description = "options: labwc, hyprland";
          };
          labwc = {
            style = lib.mkOption {
              type = lib.types.str;
              default = "flat";
              description = "options: flat, glass";
            };
          };
          hyprland = {
            style = lib.mkOption {
              type = lib.types.str;
              default = "flat";
              description = "options: flat";
            };
            windowGaps = {
              outer = lib.mkOption {
                type = lib.types.number;
                default = 5;
              };
              inner = lib.mkOption {
                type = lib.types.number;
                default = 3;
              };
            };
          };
        };
      };
      zenBrowser = {
        showBorders = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };
      mpv = {
        profile = lib.mkOption {
          type = lib.types.str;
          default = "gpu-hq";
          description = "Sets 'profile' in MPV config";
        };
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
}
