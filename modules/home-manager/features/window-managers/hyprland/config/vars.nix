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
  "$terminal" = "${defaultApps.terminal.command}";
  "$browser" = "${defaultApps.webBrowser.command}";
  "$fileManager" = "${defaultApps.fileManager.command}";
  "$menu" = "pkill walker || walker && eww --config ~/.config/widgets close power";
  "$screenshot" = "${config.bundles.desktopBase.screenshot.package}/bin/screenshot -s";
  "$screenshotFullscreen" = "${config.bundles.desktopBase.screenshot.package}/bin/screenshot";
  "$lock" = "hyprlock";
  "$colorPicker" = "${../../scripts/color.sh}";
  "$mainMod" = "SUPER";
  "$wallpaper" = wallpaperCommand;
}
