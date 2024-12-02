{pkgs, config, lib, ...}:
{
  config = lib.mkIf config.myOptions.features.amdgpu.enable {
    boot.kernelParams = [ "amd_iommu=on" ];

    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];

    environment.variables = {
      LIBVA_DRIVER_NAME = "radeonsi";
      VDPAU_DRIVER = "radeonsi";
      #OLLAMA_ACCELERATION = "rocm"; RX 6600 not supported :()
      #ROC_ENABLE_PRE_VEGA = "1";
    };


    hardware = {
      amdgpu = {
        initrd.enable = true;
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
          mesa
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
