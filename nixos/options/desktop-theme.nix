{
  lib,
  pkgs,
  ...
}: {
  # ----- DESKTOP THEME ----- #
  #
  # Theming options for the desktop.

  options.myOptions.desktopTheme = {
    # Do not enable more than one rice at once
    rice = {
      hyprland-flat = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "hyprland desktop with flat theme";
        };
      };
      labwc-flat = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "labwc desktop with flat theme";
        };
      };
      labwc-glass = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "labwc desktop with glassy theme";
        };
      };
    };
    # These options may be overridden by certain rices
    zenBrowserShowBorders = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    colorscheme = lib.mkOption {
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
      default = 32;
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
    fonts = {
      terminal = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "aporetic-serif-mono";
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
          default = "gabarito";
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
  };
}
