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
        --gnome-entry-focused-border-color: darken(#${config.lib.stylix.colors.${osConfig.desktopTheme.base16Accent}}, 30%);
      }
      #urlbar-input::selection {
        color: #${config.lib.stylix.colors.base00} !important;
        background-color: darken(#${config.lib.stylix.colors.${osConfig.desktopTheme.base16Accent}}, 40%) !important;
      }
    '';
    settings = {
      "gnomeTheme.allTabsButton" = true;
    };
  };
}
