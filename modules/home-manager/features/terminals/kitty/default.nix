{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme) terminalPadding;
in {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.enable && (osConfig.myOptions.defaultApps.terminal.command == "kitty" || osConfig.myOptions.defaultApps.terminal.command == "kitty")) {
    # home.packages = with pkgs; [ueberzugpp];
    programs.kitty = {
      enable = true;
      settings = {
        cursor_shape = "beam";
        # cursor_shape_unfocused = "block";
        enable_audio_bell = "no";
        remember_window_size = "no";
        initial_window_width = 640;
        initial_window_height = 400;
        window_padding_width = terminalPadding;
        single_window_padding_width = terminalPadding;
        confirm_os_window_close = false;
        text_composition_strategy =
          if (config.stylix.polarity == "light")
          then "legacy"
          else "platform";
      };
    };
  };
}
