{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
}
