{
  osConfig,
  lib,
  ...
}: let
  wm =
    if (osConfig.bundles.desktopBase.windowManager == "hyprland")
    then "Hyprland"
    else "sway";
in {
  config = lib.mkIf (osConfig.myOptions.bundles.desktopBase.displayManager == "none" && osConfig.myOptions.bundles.desktopBase.enable) {
    home.file.".zprofile" = {
      text = ''
        if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
          exec ${wm}
        fi
      '';
      executable = true;
    };
  };
}
