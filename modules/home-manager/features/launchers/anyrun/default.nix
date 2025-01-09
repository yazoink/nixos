{config, osConfig, lib, pkgs, ...}:
{
  options = {
    bundles.desktopBase.anyrun.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.anyrun.enable {
    home.packages = [pkgs.anyrun];
    xdg.configFile = {
      "anyrun/config.ron".text = ''
        Config(
          x: Fraction(0.500000),
          y: Absolute(15),
          width: Fraction(0.300000),
          height: Absolute(0),
          hide_icons: false,
          ignore_exclusive_zones: false,
          layer: Overlay,
          hide_plugin_info: true,
          close_on_click: true,
          show_results_immediately: false,
          max_entries: None,
          desktop_actions: true,
          terminal: Some(Terminal(
            command: "${osConfig.myOptions.defaultApps.terminal.command}",
            args: "-e {}",
          )),
          plugins: [
            "${pkgs.anyrun}/lib/libapplications.so",
            "${pkgs.anyrun}/lib/libsymbols.so",
            "${pkgs.anyrun}/lib/libtranslate.so",
          ],
          applications: (
            showAll: true,
          ),
        )
      '';
      "anyrun/style.css".text = with config.stylix.base16Scheme; ''
        * {
            all: unset;
            font-size: 15px;
            font-family: ${config.stylix.fonts.sansSerif.name};
            color: #${base05};
        }

        #window,
        #match,
        #entry,
        #plugin,
        #main {
            background: transparent;
        }

        #match.activatable {
            border-radius: 15px;
            padding: 0.3rem 0.9rem;
            margin-top: 0.01rem;
        }
        #match.activatable:first-child {
            margin-top: 0.7rem;
        }
        #match.activatable:last-child {
            margin-bottom: 0.6rem;
        }

        #plugin:hover #match.activatable {
            border-radius: 10px;
            padding: 0.3rem;
            margin-top: 0.01rem;
            margin-bottom: 0;
        }

        #match:selected,
        #match:hover,
        #plugin:hover {
            /*background: #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};*/
            background: #${base01};
            color: #${base00};
        }

        #entry {
            background: #${base00};
            border: 1px solid #${base00};
            border-radius: 15px;
            margin: 0.5rem;
            padding: 0.3rem 1rem;
        }

        list > #plugin {
            border-radius: 16px;
            margin: 0 0.3rem;
        }
        list > #plugin:first-child {
            margin-top: 0.3rem;
        }
        list > #plugin:last-child {
            margin-bottom: 0.3rem;
        }
        list > #plugin:hover {
            padding: 0.6rem;
        }

        box#main {
            background: #${base00};
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.6);
            border-radius: 15px;
            padding: 0.3rem;
        }
      '';
    };
  };
}
