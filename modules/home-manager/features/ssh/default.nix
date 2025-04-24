{
  lib,
  osConfig,
  pkgs,
  ...
}: {
  config = lib.mkIf osConfig.bundles.base.ssh.enable {
    home.file.".local/bin/deploy-ssh-config.sh".text = ''
      ${pkgs.coreutils}/bin/cat ${osConfig.sops.secrets.ssh_config.path} > /home/${osConfig.myOptions.userAccount.username}/.ssh/config
    '';
    systemd.user.services.deploy-ssh-config = {
      Unit = {
        Description = "Creates SSH config file";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.bash}/bin/bash /home/${osConfig.myOptions.userAccount.username}/.local/bin/deploy-ssh-config.sh";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
