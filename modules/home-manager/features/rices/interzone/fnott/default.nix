{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  margin = osConfig.myOptions.desktopTheme.windowGaps.outer - 5;
  inherit (config.stylix.base16Scheme) base01;
in {
  home.packages = with pkgs; [
    libnotify
  ];
  services.fnott = {
    enable = true;
    settings = {
      main = {
        anchor = "bottom-right";
        notification-margin = margin;
        edge-margin-horizontal = margin;
        edge-margin-vertical = margin;
        padding-vertical = 15;
        padding-horizontal = 15;
        border-radius = 15;
        border-size = 2;
        min-width = 300;
        max-width = 300;
        max-height = 100;
        max-timeout = 10;
      };
      low = {
        border-color = lib.mkForce "${base01}ff";
      };
      normal = {
        border-color = lib.mkForce "${base01}ff";
      };
      critical = {
        border-color = lib.mkForce "${base01}ff";
      };
    };
  };
}
