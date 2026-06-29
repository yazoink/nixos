{osConfig, ...}: let
  inherit (osConfig.myOptions) defaultApps;
  inherit (osConfig.myOptions.bundles.desktopBase.desktop) wallpaper;
  wallpaperCommand =
    if (wallpaper.type == "color")
    then "${../../scripts/swaybg.sh} -i ${wallpaper.color.hex}"
    else
      (
        if (wallpaper.image.fillType == "fill")
        then "${../../scripts/swaybg.sh} -i ${wallpaper.image.path}"
        else "${../../scripts/swaybg.sh} -t ${wallpaper.image.path}"
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
