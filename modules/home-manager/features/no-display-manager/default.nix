{
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.displayManager == "none" && osConfig.myOptions.bundles.desktopBase.enable) {
    home.file.".zprofile" = {
      text = ''
        if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
          exec Hyprland
        fi
      '';
      executable = true;
    };
  };
}
