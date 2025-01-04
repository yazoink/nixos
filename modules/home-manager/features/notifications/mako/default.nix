{pkgs, config, lib, ...}:
{
  options = {
    bundles.desktopBase.mako.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  #imports = [./sway.nix ./hyprland.nix];

  config = lib.mkIf config.bundles.desktopBase.mako.enable {
    home.packages = with pkgs; [
      libnotify
    ];
    stylix.targets.mako.enable = false;
    xdg.configFile."mako/sounds/default.wav".source = ./sounds/vine-boom.wav;
    services.mako = {
      layer = "overlay";
      enable = true;
      actions = true;
      icons = true;
      anchor = "top-right";
      borderRadius = 5;
      backgroundColor = "#${config.stylix.base16Scheme.base00}";
      textColor = "#${config.stylix.base16Scheme.base05}";
      progressColor = "over #${config.stylix.base16Scheme.base05}";
      borderColor = "#${config.stylix.base16Scheme.base01}";
      borderSize = 2;
      font = "${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.popups}";
      padding = "10";
      margin = "5";
      defaultTimeout = 5000;
      iconPath = "/run/current-system/sw/share/icons/${config.gtk.iconTheme.name}";
      /*extraConfig = ''
        on-notify=exec aplay $HOME/.config/mako/sounds/default.wav
      '';*/
      extraConfig = ''
        [urgency=low]
        border-color=#${config.stylix.base16Scheme.base01}
        background-color=#${config.stylix.base16Scheme.base00}
        text-color=#${config.stylix.base16Scheme.base05}

        [urgency=high]
        border-color=#${config.stylix.base16Scheme.base0F}
        background-color=#${config.stylix.base16Scheme.base00}
        text-color=#${config.stylix.base16Scheme.base05}
      '';
    };
  };
}
