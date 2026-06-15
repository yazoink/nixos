{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme) terminalPadding;
in {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && (osConfig.myOptions.defaultApps.terminal.command == "urxvt")) {
    # home.packages = with pkgs; [ueberzugpp];
    programs.urxvt = {
      enable = true;
      extraConfig = {
        internalBorder = terminalPadding;
      };
    };
  };
}
