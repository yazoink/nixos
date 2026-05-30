# basic system, no desktop
{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./avahi
    ./locale
    ./network
    ./nix
    ./sops
    ./user
    ./zen-kernel
    ./bootloader
    ./ssh
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
