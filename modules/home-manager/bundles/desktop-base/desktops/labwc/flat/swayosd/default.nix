{config, ...}: let
  inherit (config.lib.stylix) colors;
in {
  services.swayosd = {
    enable = true;
    topMargin = 0.8;
  };
  # xdg.configFile."swayosd/style.css".source = style;
  xdg.configFile."swayosd/style.css".text = with colors; ''
    window#osd {
      padding: 0px;
      padding: 8px 16px;
      border-radius: 16px;
      background-color: #${base00};
      border: 1px solid #${base02};
    }

    window#osd #container {
      color: #${base05};
    }

    window#osd progress {
      background-color: #${base0D};
    }
  '';
}
