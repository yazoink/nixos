{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./options.nix
    ../../modules/nixos
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t430
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];

  system.activationScripts = {
    text = ''
      echo "base00: ${config.stylix.base16Scheme.base00}"
      echo "base01: ${config.stylix.base16Scheme.base01}"
      echo "base02: ${config.stylix.base16Scheme.base02}"
      echo "base03: ${config.stylix.base16Scheme.base03}"
      echo "base04: ${config.stylix.base16Scheme.base04}"
      echo "base05: ${config.stylix.base16Scheme.base05}"
      echo "base06: ${config.stylix.base16Scheme.base06}"
      echo "base07: ${config.stylix.base16Scheme.base07}"
      echo "base08: ${config.stylix.base16Scheme.base08}"
      echo "base09: ${config.stylix.base16Scheme.base09}"
      echo "base0A: ${config.stylix.base16Scheme.base0A}"
      echo "base0B: ${config.stylix.base16Scheme.base0B}"
      echo "base0C: ${config.stylix.base16Scheme.base0C}"
      echo "base0D: ${config.stylix.base16Scheme.base0D}"
      echo "base0E: ${config.stylix.base16Scheme.base0E}"
      echo "base0F: ${config.stylix.base16Scheme.base0F}"
    '';
    deps = with config.stylix.base16Scheme; [
      base00
      base01
      base02
      base03
      base04
      base05
      base06
      base07
      base08
      base09
      base0A
      base0B
      base0C
      base0D
      base0E
      base0F
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users."gene" = {
      imports = [
        ../../home-manager
      ];
    };
  };

  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
      gfxmodeBios = "1024x768";
      theme = null;
      splashImage = null;
    };
  };

  networking.hostName = "cyberia";

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      #PasswordAuthentication = false;
    };
  };
}
