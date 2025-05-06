{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme;
  # style = config.lib.stylix.colors {
  #   template = ./style.css.mustache;
  #   extension = ".css";
  # };
in {
  options = {
    bundles.desktopBase.swayosd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.swayosd.enable {
    services.swayosd = {
      enable = true;
    };
    # xdg.configFile."swayosd/style.css".source = style;
    xdg.configFile."swayosd/style.css".text = ''
      window#osd {
        padding: 0px;
        padding: 10px 15px;
        border-radius: 999px;
        background-color: #${base16Scheme.base00};
        border: 1px solid #${base16Scheme.base01};
      }

      window#osd #container {
        color: #${base16Scheme.base05};
      }

      window#osd progress {
        background-color: #${base16Scheme."${osConfig.desktopTheme.base16Accent}"};
      }
    '';
  };
}
