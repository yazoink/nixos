{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) openbox;
in {
  options = {
    desktopTheme.rice.openbox.barColor = lib.mkOption {
      type = lib.types.str;
      default = config.stylix.base16Scheme.base00;
    };
  };
  config = lib.mkIf openbox.enable (lib.mkMerge [
    {
      desktopTheme.rice.labwc.barColor = lib.mkIf (osConfig.myOptions.desktopTheme.colorscheme == "paradise") "101010";
    }
    (import ./display-manager {inherit config osConfig lib pkgs;})
    (import ./openbox {inherit config osConfig lib pkgs;})
  ]);
}
