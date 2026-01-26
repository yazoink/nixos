{
  pkgs,
  config,
  lib,
  pkgs-stable,
  ...
}: {
  options = {
    bundles.base.zenKernel.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.zenKernel.enable {
    boot.kernelPackages = pkgs-stable.linuxKernel.packages.linux_zen;
  };
}
