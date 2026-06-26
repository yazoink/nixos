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
      "swayosd-server &"
    ]
    ++ (
      if (defaultApps.terminal.command == "footclient")
      then ["foot --server &"]
      else []
    );
}
