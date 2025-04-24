{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (config.myOptions.bundles.base.ssh) allowPasswordAuth allowRootLogin;
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
        PermitRootLogin =
          if allowRootLogin
          then "yes"
          else "no";
        PasswordAuthentication =
          if allowPasswordAuth
          then true
          else false;
      };
    };
  };
}
