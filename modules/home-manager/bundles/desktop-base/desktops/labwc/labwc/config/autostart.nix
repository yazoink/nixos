{
  osConfig,
  wallpaperCommand,
  ...
}: let
  inherit (osConfig.myOptions) defaultApps;
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
