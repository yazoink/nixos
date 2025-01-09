{config, lib, osConfig, pkgs, ...}:
{
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && osConfig.myOptions.defaultApps.terminal.command == "ghostty") {
    home.packages = [pkgs.ghostty];
    xdg.configFile."ghostty/config".text = ''
      cursor-style = bar
      cursor-style-blink = true
      clipboard-read = allow
      clipboard-write = allow
      shell-integration-features = cursor,sudo,title
    '';
  };
}
