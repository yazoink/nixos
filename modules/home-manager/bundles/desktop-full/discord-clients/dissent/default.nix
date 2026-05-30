{pkgs, lib, osConfig, ...}:
{
  config = lib.mkIf (osConfig.myOptions.defaultApps.discordClient.command == "dissent" && osConfig.myOptions.bundles.desktopBase.enable) {
    home.packages = [pkgs.dissent];
  };
}
