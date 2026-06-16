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
      positionX = "right";
      positionY = "bottom";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 5;
      control-center-margin-bottom = 5;
      control-center-margin-right = 5;
      control-center-margin-left = 5;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
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
