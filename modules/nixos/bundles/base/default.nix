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
  ];

  config = lib.mkIf config.myOptions.bundles.base.enable {
    bundles.base = {
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

      ##### Compression/Decompression #####
      zip
      unzip
      p7zip
      rar

      ##### Samba #####
      cifs-utils
      mtpfs

      ##### Misc #####
      linux-firmware
    ];
  };
}
