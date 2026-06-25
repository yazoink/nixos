{pkgs-stable, ...}: {
  boot.kernelPackages = pkgs-stable.linuxKernel.packages.linux_zen;
}
