{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme) terminalPadding;
in {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && (osConfig.myOptions.defaultApps.terminal.command == "alacritty" || osConfig.myOptions.defaultApps.terminal.command == "alacritty")) {
    # home.packages = with pkgs; [ueberzugpp];
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
          thickness = 0.25;
        };
        scrolling = {
          history = 1000;
        };
      };
    };
  };
}
