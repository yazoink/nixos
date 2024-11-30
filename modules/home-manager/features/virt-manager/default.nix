{lib, osConfig, ...}:
{
  config = lib.mkIf osConfig.myOptions.features.virtManager.enable {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };

    home.file = {
      ".config/libvirt/qemu.conf".source = ./qemu.conf;
    };
  };
}
