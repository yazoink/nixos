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
        keep-outputs = true;
        substituters = [
          "https://nix-community.cachix.org"
          "https://cache.nixos.org/"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        ];
      };
      # Automatic garbage collection
      gc = {
        automatic = true;
        dates = "04:15";
      };
    };

    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05";
  };
}
