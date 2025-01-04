{config, osConfig, lib, pkgs, ...}:
let
  inherit (config.stylix.base16Scheme) base00 base01 base05;
in
{
  options = {
    bundles.desktopBase.swaync.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.swaync.enable {
    home.packages = with pkgs; [libnotify];
    stylix.targets.swaync.enable = false;
    services.swaync = {
      enable = true;
      /*style = ''
        @define-color bg0 #${base00};
        @define-color bg1 #${base01};
        @define-color fg0 #${base05};
        @define-color accent #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};
        @define-color shadow rgba(0, 0, 0, 0.7);
        * {
          all: unset;
          font-family: ${config.stylix.fonts.sansSerif.name};
          color: @fg0;
        }
        .notification {
          background: @bg0;
        }
        .control-center {
          background: @bg0;
          border-radius: 10px;
          border: transparent;
        }
      '';*/
      settings = {
        positionX = "right";
        positionY = "top";
        layer = "overlay";
        control-center-layer = "top";
        cssPriority = "application";
        control-center-margin-top = 5;
        control-center-margin-bottom = 5;
        control-center-margin-right = 5;
        notification-2fa-action = true;
        widgets = [
          "inhibitors"
          "dnd"
          "mpris"
          "notifications"
        ];
        widget-config = {
          inhibitors = {
            text = "Inhibitors";
            button-text = "Clear All";
            clear-all-button = true;
          };
          title = {
            text = "Notifications";
            button-text = "Clear All";
            clear-all-button = false;
          };
          dnd = {
            text = "Do Not Disturb";
          };
          mpris = {
            image-size = 96;
            blur = false;
          };
        };
      };
    };
  };
}
