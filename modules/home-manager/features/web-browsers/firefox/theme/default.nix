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
        --gnome-entry-focused-border-color: #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};
      }
      #urlbar-input::selection {
        background-color: #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}} !important;
      }
    '';
    settings = {
      "gnomeTheme.allTabsButton" = true;
    };
  };
}
