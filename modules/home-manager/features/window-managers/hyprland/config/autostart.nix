{osConfig, ...}: let
  inherit (osConfig.myOptions.defaultApps) terminal;
in {
  exec-once =
    [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "$wallpaper -q"
      "waybar"
      "hypridle"
      "eww --config ~/.config/widgets open fakecorners --screen $(hyprctl monitors -j | jq '.[] | select(.focused==true) | .id') --id $(hyprctl monitors -j | jq '.[] | select(.focused==true) | .id')"
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
