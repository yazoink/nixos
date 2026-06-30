{osConfig, ...}: {
  stylix.targets.wofi.enable = false;
  programs.wofi = {
    enable = true;
    settings = {
      term = osConfig.myOptions.defaultApps.terminal;
      show_all = false;
      allow_markup = true;
      always_parse_args = true;
      print_command = true;
      allow_images = true;
      sort_order = "alphabetical";
      key_expand = "Tab";
      display_generic = true;
      prompt = "Search...";
    };
  };
}
