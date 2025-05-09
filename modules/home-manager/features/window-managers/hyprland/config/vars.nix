{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (osConfig.myOptions) defaultApps desktopTheme;
  wallpaperCommand =
    if (desktopTheme.wallpaper.type == "color")
    then "${../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.color.hex}"
    else
      (
        if (osConfig.myOptions.desktopTheme.wallpaper.image.fillType == "fill")
        then "${../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.image.path}"
        else "${../scripts/swaybg.sh} -t ${desktopTheme.wallpaper.image.path}"
      );
in {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = {
        "$terminal" = "${defaultApps.terminal.command}";
        "$browser" = "${defaultApps.webBrowser.command}";
        "$fileManager" = "${defaultApps.fileManager.command}";
        "$menu" = "pkill wofi || wofi --show drun";
        "$screenshot" = "${config.bundles.desktopBase.screenshot.package}/bin/screenshot -s";
        "$screenshotFullscreen" = "${config.bundles.desktopBase.screenshot.package}/bin/screenshot";
        "$lock" = "hyprlock";
        "$colorPicker" = "${../scripts/color.sh}";
        "$mainMod" = "SUPER";
        "$wallpaper" = wallpaperCommand;
      };
    };
  };
}
