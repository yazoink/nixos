# common configs for labwc desktops
{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) labwc labwc-glass;
in {
  options = {
    desktopTheme.rice.labwc.barColor = lib.mkOption {
      type = lib.types.str;
      default = config.stylix.base16Scheme.base00;
    };
  };
  config = lib.mkIf (labwc.enable || labwc-glass.enable) (lib.mkMerge [
    /*
      {
      desktopTheme.rice.labwc.barColor = lib.mkIf (osConfig.myOptions.desktopTheme.colorscheme == "paradise") "101010";
    }
    */
    (import ./display-manager {inherit config osConfig lib pkgs;})
    (import ./swayidle {inherit config osConfig lib pkgs;})
    (import ./labwc {inherit config osConfig lib pkgs;})
    (import ./kanshi {inherit config osConfig lib pkgs;})
  ]);
}
