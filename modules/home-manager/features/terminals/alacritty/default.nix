{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme) terminalPadding;
in {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && (osConfig.myOptions.defaultApps.terminal.command == "alacritty" || osConfig.myOptions.defaultApps.terminal.command == "footclient")) {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = terminalPadding;
            y = terminalPadding;
          };
          title = "⋆˙⟡⋆˙⟡";
        };
        cursor = {
          style = {
            shape = "Block";
            blinking = "On";
          };
        };
      };
    };
  };
}
