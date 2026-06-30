{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
  inherit (config.gtk) font iconTheme;
in {
  home.packages = with pkgs; [
    libnotify
  ];
  stylix.targets.mako.enable = false;
  services.mako = with colors; {
    enable = true;
    settings = {
      layer = "overlay";
      actions = "true";
      icons = "true";
      anchor = "bottom-right";
      border-radius = "18";
      background-color = "#${base00}";
      border-color = "#${base01}";
      text-color = "#${base05}";
      progress-color = "over #${base05}";
      border-size = "1";
      font = "${font.name} ${toString font.size}";
      padding = "15";
      margin = "5,0,0";
      outer-margin = "5";
      default-timeout = "5000";
      # icon-path = "/run/current-system/sw/share/icons/${iconTheme.name}";
      "mode=do-not-disturb" = {
        invisible = 1;
      };
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
