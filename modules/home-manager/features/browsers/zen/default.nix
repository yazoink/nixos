{inputs, osConfig, lib, system, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "zen") {
    home.packages = [inputs.zen-browser.packages."${system}".default];
  };
}
