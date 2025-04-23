{
  inputs,
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.webBrowser.command == "zen") {
    defaultApps.webBrowser.desktopFile = "zen-browser.desktop";
    programs.firefox = {
      enable = true;
      package = inputs.zen-browser.packages."x86_64-linux".default;
    };
  };
}
