{pkgs, config, lib, ...}:
{
  options = {
    bundles.base.zenKernel.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.zenKernel.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
