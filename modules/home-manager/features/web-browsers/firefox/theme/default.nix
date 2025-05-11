{
  osConfig,
  config,
  lib,
  ...
}: let
  userChrome = config.lib.stylix.colors {
    template = ./gnomeTheme.css.mustache.css.mustache;
    extension = ".css";
  };
  inherit (osConfig.myOptions.userAccount) username;
in {
  stylix.targets.firefox = {
    enable = false;
    firefoxGnomeTheme.enable = true;
    profileNames = [username];
  };
  programs.firefox.profiles.${username} = {
    userChrome = lib.mkForce ''
      @import ${./gnome-theme/gnome-theme.css}
      @import ${userChrome}
    '';
  };
}
