{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: {
  home.packages = with pkgs; [
    libnotify
  ];
  stylix.targets.swaync.enable = false;
  services.swaync = {
    enable = true;
    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "bottom";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      layer-shell-cover-screen = true;
      cssPriority = "application";
      control-center-margin-top = 5;
      control-center-margin-bottom = 5;
      control-center-margin-right = 5;
      control-center-margin-left = 5;
      control-center-height = 500;
      control-center-width = 400;
      notification-window-width = 375;
      fit-to-screen = false;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 74;
      notification-body-image-width = 74;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = ["title" "mpris" "dnd"];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        notifications = {
          text = "Notifications";
          clear-all-button = true;
          button-text = " Clear";
        };
        mpris = {
          blacklist = [];
          autohide = false;
          show-album-art = "always";
          image-size = 80;
          image-radius = 16;
        };
        volume = {
          label = "";
          expand-button-label = "";
          collapse-button-label = "";
          show-per-app = true;
          show-per-app-icon = true;
          show-per-app-label = true;
        };
      };
    };
    /*
    style = with config.stylix.base16Scheme;
    ''
      @define-color base00 ${base00}; @define-color base01 ${base01};
      @define-color base02 ${base02}; @define-color base03 ${base03};
      @define-color base04 ${base04}; @define-color base05 ${base05};
      @define-color base06 ${base06}; @define-color base07 ${base07};

      @define-color base08 ${base08}; @define-color base09 ${base09};
      @define-color base0A ${base0A}; @define-color base0B ${base0B};
      @define-color base0C ${base0C}; @define-color base0D ${base0D};
      @define-color base0E ${base0E}; @define-color base0F ${base0F};
    ''
    + (builtins.readFile ./base.css);
    */
  };
}
