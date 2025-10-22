{osConfig, ...}: let
  inherit (osConfig.myOptions.defaultApps) terminal;
in {
  exec-once =
    [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "$wallpaper -q"
      "waybar"
      "hypridle"
      "bash ~/.config/widgets/launch-corners.sh"
      "poweralertd"
      "nm-applet"
      "wl-clip-persist --clipboard regular"
      "wayland-pipewire-idle-inhibit"
      "hyprland-monitor-attached ~/.config/widgets/monitor-attached.sh"
    ]
    ++ (
      if (terminal.command == "footclient")
      then ["foot --server"]
      else []
    );
}
