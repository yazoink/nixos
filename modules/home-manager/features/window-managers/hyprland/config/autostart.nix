{
  lib,
  osConfig,
  ...
}: let
  inherit (osConfig.myOptions.defaultApps) terminal;
in {
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = {
        exec-once =
          [
            "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
            "$wallpaper -q"
            "ironbar"
            "hypridle"
            "poweralertd"
            "nm-applet"
            "wl-clip-persist --clipboard regular"
            "wayland-pipewire-idle-inhibit"
          ]
          ++ (
            if (terminal.command == "footclient")
            then ["foot --server"]
            else []
          );
      };
    };
  };
}
