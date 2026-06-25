# configs for labwc-flat theme
{
  config,
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme.rice) labwc;
in {
  options = {
    desktopTheme.rice.labwc.barColor = lib.mkOption {
      type = lib.types.str;
      default = config.stylix.base16Scheme.base00;
    };
  };
  config = lib.mkIf labwc.enable (lib.mkMerge [
    /*
      {
      desktopTheme.rice.labwc.barColor = lib.mkIf (osConfig.myOptions.desktopTheme.colorscheme == "paradise") "101010";
    }
    */
    (import ./eww {inherit config osConfig lib pkgs;})
    (import ./mako {inherit config osConfig lib pkgs;}) # either fnott or mako
    (import ./hyprlock {inherit config osConfig lib pkgs;})
    (import ./swayosd {inherit config osConfig lib pkgs;})
    (import ./wofi {inherit config osConfig lib pkgs;})
    (import ./waybar {inherit config osConfig lib pkgs;})
    (import ./labwc {inherit config osConfig lib pkgs;})
  ]);
}
