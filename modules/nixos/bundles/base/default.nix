{
  lib,
  pkgs,
  config,
  inputs,
  pkgs-stable,
  ...
}:
lib.mkIf config.myOptions.bundles.base.enable (lib.mkMerge builtins.trace "test?????" [
  {
    security.wrappers."mount.cifs" = {
      program = "mount.cifs";
      source = "${lib.getBin pkgs.cifs-utils}/bin/mount.cifs";
      owner = "root";
      group = "root";
      setuid = true;
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
  }
  (import ./avahi {inherit config lib pkgs inputs pkgs-stable;})
  (import ./bootloader {inherit config lib pkgs inputs pkgs-stable;})
  (import ./kernel {inherit config lib pkgs inputs pkgs-stable;})
  (import ./locale {inherit config lib pkgs inputs pkgs-stable;})
  (import ./network {inherit config lib pkgs inputs pkgs-stable;})
  (import ./nix {inherit config lib pkgs inputs pkgs-stable;})
  (import ./sops {inherit config lib pkgs inputs pkgs-stable;})
  (import ./ssh {inherit config lib pkgs inputs pkgs-stable;})
  (import ./user {inherit config lib pkgs inputs pkgs-stable;})
])
