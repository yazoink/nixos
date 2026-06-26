{
  config,
  osConfig,
  ...
}: let
  inherit (osConfig.myOptions) defaultApps desktopTheme;
  wallpaperCommand =
    if (desktopTheme.wallpaper.type == "color")
    then "${../../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.color.hex}"
    else
      (
        if (osConfig.myOptions.desktopTheme.wallpaper.image.fillType == "fill")
        then "${../../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.image.path}"
        else "${../../scripts/swaybg.sh} -t ${desktopTheme.wallpaper.image.path}"
      );
in {
  "$terminal" = "${defaultApps.terminal}";
  "$browser" = "${defaultApps.webBrowser}";
  "$fileManager" = "${defaultApps.fileManager}";
  "$menu" = "pkill walker || walker";
  "$screenshot" = "bash ${../../scripts/screenshot} -s";
  "$screenshotFullscreen" = "bash ${../../scripts/screenshot}";
  "$lock" = "hyprlock";
  "$colorPicker" = "${../../scripts/color.sh}";
  "$mainMod" = "SUPER";
  "$wallpaper" = wallpaperCommand;
}
