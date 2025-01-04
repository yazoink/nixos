{config, lib, pkgs, ...}:
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
        * {
          all: unset;
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
