#### Options ####
# To be enabled in ../nixos/hostname/default.nix
{lib, ...}: {
  options = {
    myOptions = {
      windowManager = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "hyprland";
        };
        isWayland = lib.mkOption {
          type = lib.types.bool;
          default = true;
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
          description = "options: caroline, carob, tarot, manuscript, rosepine, wizard";
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
        base.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        desktopBase.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        desktopFull.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };
      features = {
        etterna.enable = lib.mkOption {
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
        osu.enable = lib.mkOption {
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
        tlp.enable = lib.mkOption {
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
        vscode.enable = lib.mkOption {
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
        amdgpu.enable = lib.mkOption {
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
        };
      };
    };
  };
}
