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
