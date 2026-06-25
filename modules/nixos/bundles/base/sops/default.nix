{
  config,
  pkgs,
  ...
}: let
  inherit (config.myOptions.userAccount) username;
in {
  environment.systemPackages = with pkgs; [sops];
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

    secrets = builtins.trace "secrets set" {
      wifi_env = {};
      ssh_config = {owner = username;};
      discord_token = {owner = username;};
      factorio_token = {owner = username;};
    };
  };
}
