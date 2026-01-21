{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ../../features/avahi
    ../../features/locale
    ../../features/network
    ../../features/nix-config
    ../../features/sops
    ../../features/user
    ../../features/zen-kernel
    ../../features/bootloader
    ../../features/ssh
  ];

  config = lib.mkIf config.myOptions.bundles.base.enable {
    bundles.base = {
      ssh.enable = true;
      avahi.enable = true;
      locale.enable = true;
      network.enable = true;
      nixConfig.enable = true;
      sops.enable = true;
      user.enable = true;
      zenKernel.enable = true;
      bootloader.enable = true;
    };

    environment.systemPackages = with pkgs; [
      ##### System Info #####
      pciutils
      lshw
      inxi
      dmidecode
      lm_sensors
      usbutils
      # procps
      ncdu

      ##### Utils #####
      vim
      git
      wget
      curl
      psmisc
      coreutils-full
      ntfs3g
      util-linux
      bc
      ripgrep

      ##### Compression/Decompression #####
      zip
      unzip
      p7zip
      rar

      ##### Samba #####
      cifs-utils
      # mtpfs
      ##### Misc #####
      linux-firmware
    ];
  };
}
