{pkgs, config, lib, ...}:
{
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
    xdg.configFile."mako/sounds/default.wav".source = ./sounds/vine-boom.wav;
    services.mako = {
      enable = true;
      icons = true;
      anchor = "top-right";
      borderRadius = 5;
      borderColor = lib.mkForce "#${config.stylix.base16Scheme.base01}";
      padding = "10";
      margin = "5";
      borderSize = 2;
      defaultTimeout = 5000;
      iconPath = "/run/current-system/sw/share/icons/${config.gtk.iconTheme.name}";
      /*extraConfig = ''
        on-notify=exec aplay $HOME/.config/mako/sounds/default.wav
      '';*/
    };
  };
}
