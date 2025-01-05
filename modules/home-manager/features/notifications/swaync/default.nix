{config, osConfig, lib, pkgs, ...}:
let
  themeFile = config.lib.stylix.colors {
    template = ./style.css.mustache;
    extension = ".css";
  };
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
      style = ''
        @define-color accent #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};

        * {
          font-family: ${config.stylix.fonts.sansSerif.name};
        }
      '' + (builtins.readFile themeFile);
      settings = {
        positionX = "right";
        positionY = "bottom";
        layer = "top";
        control-center-layer = "top";
        cssPriority = "application";
        control-center-margin-top = 15;
        control-center-margin-bottom = 15;
        control-center-margin-right = 15;
        notification-2fa-action = false;
        widgets = [
          "inhibitors"
          "dnd"
          "buttons-grid"
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
            blur = false;
          };
          buttons-grid = {
            actions = [
              {
                label = "󰌾";
                type = "normal";
                command = "gtklock";
              }
              {
                label = "󰍃";
                type = "normal";
                command = "swaymsg exit";
              }
              {
                label = "󰜉";
                type = "normal";
                command = "systemctl reboot";
              }
              {
                label = "󰐥";
                type = "normal";
                command = "systemctl poweroff";
              }
            ];
          };
        };
      };
    };
  };
}
