{
  config,
  lib,
  ...
}: let
  inherit (config.myOptions.bundles.base.ssh) allowPasswordAuth allowRootLogin;
in {
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
    extraConfig = ''
      MaxAuthTries 10
    '';
  };
}
