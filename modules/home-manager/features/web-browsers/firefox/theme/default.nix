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
         /* --gnome-entry-focused-border-color: color-mix(in srgb, #${accentColor} 55%, black) !important; */
         --gnome-menu-border-color: #${colors.base01};
         --gnome-menu-separator-color: #${colors.base01};
         --gnome-menu-item-padding: 5px;
       }
       #urlbar-input::selection {
         color: #${colors.base05} !important;
         background-color: color-mix(in srgb, #${accentColor} 45%, black) !important;
       }
       .urlbarView-body-outer, .search-one-offs {
         border: 1px solid #${colors.base01};
       }
       .urlbarView-body-outer {
         border-radius: 12px 12px 0 0 !important;
         border-bottom: transparent;
       }
       .search-one-offs {
         border-radius: 0 0 12px 12px !important;
         border-top: transparent;
       }
       .menupopup-arrowscrollbox {
         border: 1px solid #${colors.base01};
       }
       #star-button[starred] {
       fill: var(--gnome-toolbar-star-button) !important;
      }
    '';
    settings = {
      "gnomeTheme.allTabsButton" = true;
    };
  };
}
