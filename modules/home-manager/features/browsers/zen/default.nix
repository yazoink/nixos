{pkgs, osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "zen") {
    home.packages = [pkgs.callPackage ./zen.nix {}];
  };
}
