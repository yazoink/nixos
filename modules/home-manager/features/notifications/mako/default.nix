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
      layer = "overlay";
      enable = true;
      actions = true;
      icons = true;
      anchor = "top-right";
      borderRadius = 10;
      backgroundColor = "#${config.stylix.base16Scheme.base00}";
      textColor = "#${config.stylix.base16Scheme.base05}";
      progressColor = "over #${config.stylix.base16Scheme.base05}";
      borderColor =
        if (osConfig.myOptions.desktopTheme.name == "catppuccin-mocha")
        then "#${config.stylix.base16Scheme.base02}"
        else "#${config.stylix.base16Scheme.base01}";
      borderSize = 1;
      font = "${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.popups}";
      padding = "15";
      margin = "5";
      defaultTimeout = 5000;
      iconPath = "/run/current-system/sw/share/icons/${config.gtk.iconTheme.name}";
      /*
        extraConfig = ''
        on-notify=exec aplay $HOME/.config/mako/sounds/default.wav
      '';
      */
      extraConfig = ''
        [urgency=low]
        border-color=#${config.stylix.base16Scheme.base01}
        background-color=#${config.stylix.base16Scheme.base00}
        text-color=#${config.stylix.base16Scheme.base05}

        [urgency=high]
        border-color=#${config.stylix.base16Scheme.base0F}
        background-color=#${config.stylix.base16Scheme.base00}
        text-color=#${config.stylix.base16Scheme.base05}

        [mode=do-not-disturb]
        invisible=1
      '';
    };
  };
}
