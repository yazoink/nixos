{osConfig, ...}: let
  inherit (osConfig.myOptions.userAccount) username;
in {
  environment = [
    "XDG_CURRENT_DESKTOP=labwc:wlroots"
    "XKB_DEFAULT_LAYOUT=us"
    "NIXOS_OZONE_WL=1"
    "MOZ_ENABLE_WAYLAND=1"
    "GDK_BACKEND=wayland"
    "GDK_SCALE=1"
    "CLUTTER_BACKEND=wayland"
    "XDG_SESSION_TYPE=wayland"
    "QT_AUTO_SCREEN_SCALE_FACTOR=1"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
    "QT_QPA_PLATFORM=wayland;xcb"
    "QT_SCALE_FACTOR=1"
    "QT_QPA_PLATFORMTHEME=qt6ct"
    "QT_ENABLE_HIGHDPI_SCALING=0"
    "_JAVA_AWT_WM_NONREPARENTING=1"
    "ELECTRON_OZONE_PLATFORM_HINT=wayland"
    "EWW_CONFIG_DIR=/home/${username}/.config/eww"
  ];
}
