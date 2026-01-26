{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  options = {
    bundles.base.zenKernel.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.zenKernel.enable {
    boot.kernelPackages = inputs.nixpkgs-stable.linuxKernel.packages.linux_zen;
  };
}
