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
      term = osConfig.myOptions.defaultApps.terminal.command;
      width = "25%";
      height = "45%";
      show_all = false;
      allow_markup = true;
      always_parse_args = true;
      print_command = true;
      allow_images = true;
      sort_order = "alphabetical";
      key_expand = "Tab";
      yoffset = 18;
      xoffset = 0;
      location = "bottom_left";
      display_generic = true;
      prompt = "Search...";
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
