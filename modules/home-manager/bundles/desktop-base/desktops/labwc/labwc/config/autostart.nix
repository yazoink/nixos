{osConfig, ...}: let
  inherit (osConfig.myOptions) defaultApps desktopTheme;
  wallpaperCommand =
    if (desktopTheme.wallpaper.type == "color")
    then "${../../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.color.hex}"
    else
      (
        if (osConfig.myOptions.desktopTheme.wallpaper.image.fillType == "fill")
        then "${../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.image.path}"
        else "${../scripts/swaybg.sh} -t ${desktopTheme.wallpaper.image.path}"
      );
in {
  autostart =
    [
      "waybar &"
      "${wallpaperCommand} -q &"
      "poweralertd &"
      "nm-applet &"
      "wl-clip-persist --clipboard regular &"
      "wayland-pipewire-idle-inhibit &"
      "swayidle &"
    ]
    ++ (
      if (defaultApps.terminal.command == "footclient")
      then ["foot --server &"]
      else []
    )
    /*
      ++ (
      if (osConfig.networking.hostName == "fluoride")
      then [
        "${lib.getExe pkgs.wlr-randr} --output DP-1 --scale 1.4 &"
        "${lib.getExe pkgs.wlr-randr} --output DP-2 --scale 1.4 &"
      ]
      else [""]
    )
    */
    ;
}
