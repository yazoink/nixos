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
        width = 650;
        height = 350;
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
      };
      style = with config.stylix.base16Scheme; ''
        * {
          font-family: "${config.stylix.fonts.sansSerif.name}";
          font-size: ${builtins.toString config.stylix.fonts.sizes.popups}pt;
        }

        window {
          background: transparent;
        }

        #outer-box {
          background: #${base00};
          border: 1px solid #${base02};
          border-radius: 10px;
          padding: 15px;
          /*box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);*/
        }

        #input {
          margin-bottom: 10px;
          border-radius: 10px;
          background: #${base01};
        }

        #inner-box {
          border-radius: 15px;
        }

        #entry, #selected, #unselected {
          padding: 3px;
          border-radius: 10px;
          border: transparent;
        }

        .entry > #selected {
          background: #${base01};
        }

        #img {
          padding-right: 10px;
        }
      '';
    };
  };
}
