{pkgs, config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.amdgpu.enable {
    boot.initrd.kernelModules = ["amdgpu"];

    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          amdvlk
          rocmPackages.clr.icd
          rocm-opencl-icd
          rocm-opencl-runtime
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
