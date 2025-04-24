{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (config.myOptions.bundles.base) sshAllowPasswordAuth;
in {
  options = {
    bundles.base.ssh.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.base.ssh.enable {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication =
          if sshAllowPasswordAuth
          then true
          else false;
      };
    };
  };
}
