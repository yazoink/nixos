{config, lib, pkgs, modulesPath, ...}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
	"xhci_pci"
	"ehci_pci"
	"ahci"
	"nvme"
	"usb_storage"
	"sd_mod"
	"sr_mod"
	"sdhci_pci"
      ];
      kernelModules = [];
    };
    kernelModules = [
      "kvm-intel"
    ];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/7cfc7833-4ed0-4c88-aade-593c962be9c1";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/32ab3311-d94f-45c1-b3e6-a15e12dd3c0e";
      fsType = "ext4";
    };
    "/mnt/drive2" = {
      device = "/dev/nvme0n1";
      fsType = "ext4";
      depends = [
	"/"
	"/boot"
      ];
      options = [
	"users"
	"nofail"
      ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/45b46bd1-7861-4650-ae7c-e5204c20104d"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
