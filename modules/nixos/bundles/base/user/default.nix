{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (config.myOptions.userAccount) username;
  inherit (config.myOptions.bundles) desktopBase;
in {
  programs.zsh.enable = true;
  security.sudo.wheelNeedsPassword = false;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGkfEKvyb8eEjHXP0bjq1lqcphAOBbpSzvWMQ+gAC795 gene@cyberia"
      ];
      extraGroups = lib.mkMerge [
        [
          "wheel"
          "cdrom"
          "camera"
        ]
        (lib.mkIf desktopBase.enable
          [
            "audio"
            "video"
          ])
        (lib.mkIf config.programs.virt-manager.enable
          ["libvirtd"])
        (lib.mkIf config.networking.networkmanager.enable
          ["networkmanager"])
        (lib.mkIf config.programs.gamemode.enable
          ["gamemode"])
      ];
    };
    extraGroups.vboxusers.members = lib.mkIf config.virtualisation.virtualbox.host.enable [username];
  };
}
