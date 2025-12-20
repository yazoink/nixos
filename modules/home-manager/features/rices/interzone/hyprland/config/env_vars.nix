{osConfig}: {
  env = [
    "NIXOS_OZONE_WL,1"
    "MOZ_ENABLE_WAYLAND,1"
    "GDK_BACKEND,wayland"
    "GDK_SCALE,1"
    "CLUTTER_BACKEND,wayland"
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "QT_AUTO_SCREEN_SCALE_FACTOR,1"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    "QT_QPA_PLATFORM,wayland;xcb"
    "QT_SCALE_FACTOR,1"
    "QT_ENABLE_HIGHDPI_SCALING,0"
    "_JAVA_AWT_WM_NONREPARENTING,1"
    "ELECTRON_OZONE_PLATFORM_HINT,wayland"
    "EWW_CONFIG_DIR,/home/${osConfig.myOptions.userAccount.username}/.config/widgets"
  ];
}
