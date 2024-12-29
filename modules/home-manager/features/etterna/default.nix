{pkgs, lib, osConfig, ...}:
let
  etterna = pkgs.callPackage ./etterna.nix {};
  script = ./local-install.sh;
  desktopFile = ./etterna.desktop;
in
{
  config = lib.mkIf osConfig.myOptions.features.etterna.enable {
    home.packages = [etterna];
    home.file.".local/share/icons/etterna.png".source = ./icon.png;
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
