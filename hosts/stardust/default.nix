{
  inputs,
  lib,
  config,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./options.nix
    ./hardware-configuration.nix
  ];

  boot = {
    kernelParams = ["amd_iommu=on"];
  };

  environment.variables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    VDPAU_DRIVER_NAME = "radeonsi";
  };

  environment.systemPackages = with pkgs; [osu-lazer-bin prismlauncher];

  hardware = {
    amdgpu = {
      initrd.enable = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        mesa
      ];
    };
  };

  services.xserver.videoDrivers = ["amdgpu" "modesetting" "fbdev"];

  networking.hostName = "stardust";
}
