{pkgs, config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.amdgpu.enable {
    boot.initrd.kernelModules = ["amdgpu"];
    boot.kernelParams = [ "amd_iommu=on" ];

    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];

    environment.variables = {
      LIBVA_DRIVER_NAME = "radeonsi";
      VDPAU_DRIVER = "radeonsi";
    };


    hardware = {
      amdgpu = {
        opencl.enable = true;
        amdvlk = {
          enable = true;
          support32Bit.enable = true;
        };
      };
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          amdvlk
          rocmPackages.clr.icd
          mesa
        ];
        extraPackages32 = with pkgs; [
          driversi686Linux.amdvlk
        ];
      };
    };

    services.xserver.videoDrivers = ["amdgpu"];

    environment.systemPackages = with pkgs; [
      rocmPackages.rocm-smi
      rocmPackages.rocminfo
    ];
  };
}
