{pkgs, lib, osConfig, ...}:
let
  abaddonCss = pkgs.callPackage ./abaddon-css.nix {};
in
{
  config = lib.mkIf (osConfig.myOptions.defaultApps.discordClient == "abaddon" && osConfig.myOptions.bundles.desktopBase.enable) {
    home.packages = [pkgs.abaddon abaddonCss];

    systemd.user.services.deploy-abaddon-config = {
      Unit = {
        Description = "Creates Abaddon config file";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${lib.getExe pkgs.bash} ${./script.sh} ${osConfig.sops.secrets.discord_token.path} ${osConfig.myOptions.userAccount.username}";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
