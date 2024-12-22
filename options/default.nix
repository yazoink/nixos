#### Options ####
# To be enabled in ../nixos/hostname/default.nix
{lib, ...}: {
  options = {
    myOptions = {
      userAccount = {
        username = lib.mkOption {
          type = lib.types.str;
          default = "gene";
        };
      };
      desktopTheme = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        name = lib.mkOption {
          type = lib.types.str;
          default = "caroline";
          description = "options: caroline, carob";
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
        amdgpu.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        fstrim.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        gamescope.enable = lib.mkOption {
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
        diskBurner.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };
    };
  };
}
