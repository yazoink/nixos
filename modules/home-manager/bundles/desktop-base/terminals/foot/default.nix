{osConfig, ...}: let
  inherit (osConfig.myOptions.desktopTheme) terminalPadding;
in {
  programs.foot = {
    enable = true;
    #server.enable = lib.mkIf (osConfig.myOptions.defaultApps.terminal.command == "footclient") true;
    settings = {
      main = {
        pad = "${builtins.toString terminalPadding}x${builtins.toString terminalPadding}";
        title = "snail man is real";
      };
      cursor = {
        style = "beam";
        blink = "yes";
      };
      bell = {
        notify = "no";
      };
      scrollback = {
        lines = 500;
      };
    };
  };
}
