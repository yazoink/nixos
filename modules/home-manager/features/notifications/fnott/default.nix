{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  margin = osConfig.myOptions.desktopTheme.windowGaps.outer - 5;
in {
  options = {
    bundles.desktopBase.fnott.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.bundles.desktopBase.fnott.enable {
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
        };
      };
    };
  };
}
