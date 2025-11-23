{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: {
  options = {
    bundles.desktopBase.mako.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.bundles.desktopBase.mako.enable {
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
        anchor = "bottom-right";
        border-radius = "15";
        background-color = "#${config.stylix.base16Scheme.base00}";
        text-color = "#${config.stylix.base16Scheme.base05}";
        progress-color = "over #${config.stylix.base16Scheme.base05}";
        border-color =
          if (osConfig.myOptions.desktopTheme.name == "catppuccin-mocha")
          then "#${config.stylix.base16Scheme.base02}"
          else "#${config.stylix.base16Scheme.base01}";
        border-size = "1";
        font = "${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.popups}";
        padding = "15";
        margin = "0";
        outer-margin = "${builtins.toString osConfig.myOptions.desktopTheme.windowGaps.outer - 5}";
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
  };
}
