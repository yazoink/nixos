{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
  # style = config.lib.stylix.colors {
  #   template = ./style.css.mustache;
  #   extension = ".css";
  # };
in {
  services.swayosd = {
    enable = true;
  };
  # xdg.configFile."swayosd/style.css".source = style;
  xdg.configFile."swayosd/style.css".text = with colors; ''
    window#osd {
      padding: 0px;
      padding: 10px 15px;
      border-radius: 999px;
      background-color: #${base00};
      border: 1px solid #${base01};
    }

    window#osd #container {
      color: #${base05};
    }

    window#osd progress {
      background-color: #${base0D};
    }
  '';
}
