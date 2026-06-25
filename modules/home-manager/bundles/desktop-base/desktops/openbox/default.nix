{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice.openbox) enable;
in {
  options = {
    desktopTheme.rice.openbox.barColor = lib.mkOption {
      type = lib.types.str;
      default = config.stylix.base16Scheme.base00;
    };
  };
  config = lib.mkIf enable (lib.mkMerge [
    (import ./display-manager {inherit config osConfig lib pkgs;})
    (import ./openbox {inherit config osConfig lib pkgs;})
  ]);
}
