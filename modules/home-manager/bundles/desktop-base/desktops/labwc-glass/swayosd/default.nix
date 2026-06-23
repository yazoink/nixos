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
  services.swayosd = {
    enable = true;
  };
  # xdg.configFile."swayosd/style.css".source = style;
  xdg.configFile."swayosd/style.css".text = ''
    window#osd {
      padding: 0px;
      padding: 6px 12px;
      border-radius: 0px;
      background-color: #${base16Scheme.base01};
      border: 1px solid #${base16Scheme.base03};
    }

    window#osd #container {
      color: #${base16Scheme.base05};
    }

    window#osd progress {
      background-color: #${base16Scheme."${osConfig.desktopTheme.base16Accent}"};
    }
  '';
}
