{config, inputs, lib, pkgs, ...}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  options = {
    bundles.base.sops.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.sops.enable {
    environment.systemPackages = with pkgs; [sops];
    sops = {
      defaultSopsFile = ./secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/${config.myOptions.userAccount.username}/.config/sops/age/keys.txt";

      secrets = builtins.trace "secrets set" {
        wifi_env = {};
        ssh_config = {owner="${config.myOptions.userAccount.username}";};
        discord_token = {};
      };
    };
  };
}
