{inputs, osConfig, lib, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "zen") {
    home.packages = [inputs.zen-browser.packages."x86_64-linux".twilight];
  };
}
