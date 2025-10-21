{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  style = config.lib.stylix.colors {
    template =
      if (osConfig.myOptions.desktopTheme.name == "catppuccin-mocha")
      then ./style-catppuccin.css.mustache
      else ./style.css.mustache;
    extension = ".css";
  };
in {
  options = {
    bundles.desktopBase.wofi.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.wofi.enable {
    stylix.targets.wofi.enable = false;
    programs.wofi = {
      enable = true;
      settings = {
        term = osConfig.myOptions.defaultApps.terminal.command;
        width = "25%";
        height = "25%";
        show_all = false;
        allow_markup = true;
        always_parse_args = true;
        print_command = true;
        allow_images = true;
        sort_order = "alphabetical";
        key_expand = "Tab";
        location = "top";
        yoffset = 5;
        display_generic = true;
        prompt = "Run";
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
  };
}
