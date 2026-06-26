{lib, ...}: {
  # ----- FEATURES ----- #
  #
  # Miscellaneous modules and packages not in any bundle to be freely
  # enabled.
  #
  # Most, if not all require at least the Desktop Base bundle to be
  # enabled.

  options.myOptions.features = {
    garfetch = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      style = lib.mkOption {
        type = lib.types.number;
        default = 1;
        description = "options: 1, 2";
      };
    };
    lutgen.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    plymouth.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    silentBoot.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    wine.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    gamescope.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    retroarch.enable = lib.mkOption {
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
    expenses.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    calibre.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    vscode.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    obsidian.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
