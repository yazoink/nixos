{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: {
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
        width = 750;
        height = 400;
        show_all = false;
        allow_markup = true;
        always_parse_args = true;
        print_command = true;
        allow_images = true;
        sort_order = "alphabetical";
        key_expand = "Tab";
        location = "center";
        display_generic = true;
      };
      style = with config.stylix.base16Scheme; ''
        * {
          font-family: "${config.stylix.fonts.sansSerif.name}";
          font-size: ${builtins.toString config.stylix.fonts.sizes.popups}pt;
        }

        window {
          border: 2px solid ${base01};
          border-radius: 15px;
        }
      '';
    };
  };
}
