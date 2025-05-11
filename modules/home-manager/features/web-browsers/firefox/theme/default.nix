{
  osConfig,
  config,
  lib,
  ...
}: let
  userChrome = config.lib.stylix.colors {
    template = ./gnomeTheme.css.mustache;
    extension = ".css";
  };
  inherit (osConfig.myOptions.userAccount) username;
  inherit (config.lib.stylix) colors;
  accentColor = colors.${osConfig.desktopTheme.base16Accent};
in {
  stylix.targets.firefox = {
    enable = true;
    firefoxGnomeTheme.enable = true;
    profileNames = [username];
  };
  programs.firefox.profiles.${username} = {
    userChrome = lib.mkForce ''
      @import "${config.stylix.inputs.firefox-gnome-theme}/userChrome.css";
      @import "${userChrome}";
      :root {
        --gnome-entry-focused-border-color: #${accentColor};
        --gnome-entry-focused-border-color: color-mix(in srgb, #${accentColor} 55%, black) !important;
        --gnome-menu-border-color: #${colors.base01};
        --gnome-menu-padding: 5px;
        --gnome-dialog-padding: 5px;
      }
      #urlbar-input::selection {
        color: #${colors.base05} !important;
        background-color: color-mix(in srgb, #${accentColor} 45%, black) !important;
      }
      .menupopup-arrowscrollbox {
        border: 1px solid #${colors.base01};
      }
      menupopup > menu,
      menupopup > menuitem {
          padding-block: 5px !important;     /* Adjust vertical padding */
          padding-inline: 5px !important;   /* Adjust horizontal padding */
      }
    '';
    settings = {
      "gnomeTheme.allTabsButton" = true;
    };
  };
}
