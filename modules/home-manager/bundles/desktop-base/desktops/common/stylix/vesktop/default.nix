{colors, ...}: let
  themeFile = colors {
    template = ./my.theme.css.mustache;
    extension = ".css";
  };
in {
  stylix.targets.nixcord = {
    enable = false;
  };
  xdg.configFile = {
    "vesktop/themes/my.theme.css".source = themeFile;
  };
  programs.nixcord = {
    /*
      quickCss = ''
      :root {
        --font: sans;
        --font-primary: sans;
        --font-display: sans;
      }

      * {
        font-family: sans;
      }

      body {
        --font: sans;
        --font-primary: sans;
        --font-display: sans;
      }
    '';
    */
    config = {
      # useQuickCss = true;
      enabledThemes = ["my.theme.css"];
      transparent = false;
    };
  };
}
