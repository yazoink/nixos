{osConfig, ...}: let
  inherit (osConfig.myOptions.desktopTheme) terminalPadding;
in {
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
}
