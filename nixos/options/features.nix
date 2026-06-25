{lib, ...}: {
  # ----- FEATURES ----- #
  #
  # Miscellaneous modules and packages not in any bundle to be freely
  # enabled.
  #
  # Most, if not all require at least the Desktop Base bundle to be
  # enabled.

  options.myOptions.features = {
    lutgen.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
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
