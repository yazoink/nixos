{lib, ...}: {
  options = {
    bundles.base.bootloader.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  imports = [
    ./uefi.nix
    ./legacy.nix
  ];
}
