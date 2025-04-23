{
  config,
  lib,
  ...
}: {
  options = {
    bundles.base.nixConfig.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.nixConfig.enable {
    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };

    nix = {
      settings = {
        experimental-features = "nix-command flakes";
        auto-optimise-store = true;
      };
      # Automatic garbage collection
      gc = {
        automatic = true;
        dates = "04:15";
      };
    };

    hardware.enableAllFirmware = true;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05";
  };
}
