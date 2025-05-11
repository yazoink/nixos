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
  inherit (config.lib.stylix.colors);
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
        --gnome-entry-focused-border-color: color-mix(in-srgb, #${config.lib.stylix.colors.${osConfig.desktopTheme.base16Accent}} 30%, black);
      }
      #urlbar-input::selection {
        color: #${config.lib.stylix.colors.base00} !important;
        background-color: color-mix(in srgb, #${config.lib.stylix.colors.${osConfig.desktopTheme.base16Accent}} 40%, black) !important;
      }
      menupopup {
        border: 1px solid #${config.lib.stylix.colors.base01};
      }
    '';
    settings = {
      "gnomeTheme.allTabsButton" = true;
    };
  };
}
