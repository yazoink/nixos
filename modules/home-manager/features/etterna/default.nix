{pkgs, config, lib, osConfig, ...}:
let
  etterna = pkgs.callPackage ./etterna.nix {};
  script = ./local-install.sh;
  desktopFile = ./etterna.desktop;
in
{
  options = {
    bundles.desktopFull.etterna.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopFull.etterna.enable {
    home.packages = [etterna];
    systemd.user.services.etterna-local-install = {
      Unit = {
        Description = "Install Etterna locally";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.bash}/bin/bash ${script} ${etterna} ${desktopFile} ${osConfig.myOptions.userAccount.username}";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
