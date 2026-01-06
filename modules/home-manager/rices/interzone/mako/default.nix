{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  margin = 0;
in {
  home.packages = with pkgs; [
    libnotify
  ];
  stylix.targets.mako.enable = false;
  services.mako = {
    enable = true;
    settings = {
      layer = "overlay";
      actions = "true";
      icons = "true";
      anchor = "top-right";
      border-radius = "15";
      background-color = "#${config.stylix.base16Scheme.base00}";
      border-color = "#${config.stylix.base16Scheme.base02}";
      text-color = "#${config.stylix.base16Scheme.base05}";
      progress-color = "over #${config.stylix.base16Scheme.base05}";
      border-size = "1";
      font = "${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.popups}";
      padding = "15";
      margin = "5";
      outer-margin = "${builtins.toString margin}";
      default-timeout = "5000";
      icon-path = "/run/current-system/sw/share/icons/${config.gtk.iconTheme.name}";
    };
    /*
      extraConfig = ''
      on-notify=exec aplay $HOME/.config/mako/sounds/default.wav
    '';
    */
    # extraConfig = ''
    #   [urgency=low]
    #   border-color=#${config.stylix.base16Scheme.base01}
    #   background-color=#${config.stylix.base16Scheme.base00}
    #   text-color=#${config.stylix.base16Scheme.base05}
    #
    #   [urgency=high]
    #   border-color=#${config.stylix.base16Scheme.base0F}
    #   background-color=#${config.stylix.base16Scheme.base00}
    #   text-color=#${config.stylix.base16Scheme.base05}
    #
    #   [mode=do-not-disturb]
    #   invisible=1
    # '';
  };
}
