{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  themeFile = config.lib.stylix.colors {
    #template = ./${osConfig.myOptions.bundles.desktopBase.windowManager}.css.mustache;
    template = ./style.css.mustache;
    extension = ".css";
  };
in {
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
      style =
        ''
          @define-color accent #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};

          * {
            font-family: ${config.stylix.fonts.sansSerif.name};
          }
        ''
        + (builtins.readFile themeFile);
      settings = {
        positionX = "center";
        positionY = "top";
        layer = "top";
        control-center-layer = "top";
        cssPriority = "application";
        control-center-margin-top = 5;
        control-center-margin-bottom = 5;
        control-center-margin-right = 5;
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
                command = "${lib.getExe pkgs.gtklock}";
              }
              {
                label = "󰍃";
                type = "normal";
                command = "${pkgs.sway}/bin/swaymsg exit";
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
