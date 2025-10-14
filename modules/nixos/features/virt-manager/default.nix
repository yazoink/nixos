{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.myOptions.features.virtManager.enable {
    environment.systemPackages = with pkgs; [
      qemu
      virtiofsd
    ];

    virtualisation.libvirtd = {
      enable = true;
      allowedBridges = ["virbr0" "br0"];
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };

    programs.virt-manager.enable = true;
  };
}
