{wallpaperCommand, ...}: {
  autostart = [
    "waybar &"
    "${wallpaperCommand} -q &"
    "poweralertd &"
    "nm-applet &"
    "wl-clip-persist --clipboard regular &"
    "wayland-pipewire-idle-inhibit &"
    "swayidle &"
    "${../../scripts/launch-eww.sh} &"
  ];
}
