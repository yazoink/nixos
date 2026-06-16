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
      control-center-margin-top = 4;
      control-center-margin-bottom = 4;
      control-center-margin-right = 4;
      control-center-margin-left = 4;
      control-center-height = 600;
      control-center-width = 450;
      notification-window-width = 350;
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
      widgets = ["title" "mpris" "notifications" "dnd"];
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
        };
        mpris = {
          blacklist = [];
          autohide = true;
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
    style = with config.stylix.base16Scheme;
      ''
        :root {
          --base00: #${base00};
          --base01: #${base01};
          --base02: #${base02};
          --base03: #${base03};
          --base04: #${base04};
          --base05: #${base05};
          --base06: #${base06};
          --base07: #${base07};

          --base08: #${base08};
          --base09: #${base09};
          --base0A: #${base0A};
          --base0B: #${base0B};
          --base0C: #${base0C};
          --base0D: #${base0D};
          --base0E: #${base0E};
          --base0F: #${base0F};
        }
      ''
      + (builtins.readFile ./base.css);
  };
}
