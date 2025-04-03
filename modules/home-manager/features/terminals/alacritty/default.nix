{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme) terminalPadding;
in {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && (osConfig.myOptions.defaultApps.terminal.command == "alacritty" || osConfig.myOptions.defaultApps.terminal.command == "alacritty")) {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = terminalPadding;
            y = terminalPadding;
          };
          title = "snail man is real";
        };
        cursor = {
          style = {
            shape = "Beam";
            blinking = "On";
          };
        };
        scrolling = {
          history = 1000;
        };
      };
    };
  };
}
