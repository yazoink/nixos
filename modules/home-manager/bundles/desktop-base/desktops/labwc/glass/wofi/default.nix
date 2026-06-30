{
  config,
  osConfig,
  ...
}: let
  style = config.lib.stylix.colors {
    template = ./style.css.mustache;
    extension = ".css";
  };
in {
  stylix.targets.wofi.enable = false;
  programs.wofi = {
    enable = true;
    settings = {
      width = "25%";
      height = "45%";
      yoffset = -33;
      xoffset = 0;
      location = "bottom_left";
    };
    style =
      ''
        * {
          font-family: "${config.stylix.fonts.sansSerif.name}";
          font-size: ${builtins.toString config.stylix.fonts.sizes.popups}pt;
        }
      ''
      + builtins.readFile style;
  };
}
