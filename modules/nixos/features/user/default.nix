{config, lib, pkgs, ...}:
{
  options = {
    bundles.base.user.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.user.enable {
    programs.zsh.enable = true;
    users = {
      defaultUserShell = pkgs.zsh;
      users."${config.myOptions.userAccount.username}" = {
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGkfEKvyb8eEjHXP0bjq1lqcphAOBbpSzvWMQ+gAC795 gene@cyberia"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGazraEEc7mlqlzLB4BePXgNG5tkb0UiHWBuC29PyJUN gmav@nixserver1"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGPUe+C8GS6Xvtz2r+ArNzf0cvgiSlod6nnLVhgDZUuV gmav@nixserver2"
        ];
        extraGroups = [
          "wheel"
          "cdrom"
        ] ++ (if config.programs.adb.enable then ["adbusers"] else [])
          ++ (if config.myOptions.bundles.desktopBase.enable then [
            "audio"
            "video"
          ] else [])
          ++ (if config.myOptions.features.virtManager.enable then ["libvirtd"] else [])
          ++ (if config.networking.networkmanager.enable then ["networkmanager"] else [])
          ++ (if config.programs.gamemode.enable then ["gamemode"] else []);
      };
      extraGroups.vboxusers.members =
        if config.virtualisation.virtualbox.host.enable then ["${config.myOptions.userAccount.username}"] else [];
    };
  };
}
