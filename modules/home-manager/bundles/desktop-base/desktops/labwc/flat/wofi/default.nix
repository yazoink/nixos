{config, ...}: let
  style = config.lib.stylix.colors {
    template = ./style.css.mustache;
    extension = ".css";
  };
in {
  stylix.targets.wofi.enable = false;
  programs.wofi = {
    enable = true;
    settings = {
      width = "35%";
      height = "45%";
      # yoffset = -39;
      # xoffset = 5;
      # location = "bottom_left";
      location = 0;
      # use_search_box = false;
      close_on_focus_loss = true;
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
