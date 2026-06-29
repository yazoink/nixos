{
  config,
  lib,
  osConfig,
  ...
}: let
  base16Scheme = config.lib.stylix.colors;
  # style = config.lib.stylix.colors {
  #   template = ./style.css.mustache;
  #   extension = ".css";
  # };
in {
  services.swayosd = {
    enable = true;
    topMargin = 0.8;
  };
  # xdg.configFile."swayosd/style.css".source = style;
  xdg.configFile."swayosd/style.css".text = ''
    window#osd {
      padding: 0px;
      padding: 6px 12px;
      border-radius: 8px;
      background-color: #${base16Scheme.base01};
      border: 1px solid #${base16Scheme.base03};
      box-shadow: 0 0 4px rgba(0, 0, 0, 0.4);
    }

    window#osd #container {
      color: #${base16Scheme.base05};
    }

    window#osd progress {
      background-color: #${base16Scheme.base0D};
    }
  '';
}
