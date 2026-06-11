# todo: menu, eww keybinds, keybind popup?
{
  osConfig,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (osConfig.myOptions) desktopTheme;
  wallpaperCommand =
    if (desktopTheme.wallpaper.type == "color")
    then "${../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.color.hex}"
    else
      (
        if (osConfig.myOptions.desktopTheme.wallpaper.image.fillType == "fill")
        then "${../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.image.path}"
        else "${../scripts/swaybg.sh} -t ${desktopTheme.wallpaper.image.path}"
      );
in
  lib.mkMerge [
    {
      home.packages = with pkgs; [
        wlr-randr
        wtype
        wl-clipboard
        wf-recorder
        wayland-pipewire-idle-inhibit
        wl-clip-persist
        networkmanagerapplet
        brightnessctl
        poweralertd
        grim
        slurp
        hyprpicker
        wdisplays
        swaybg
        libnotify
      ];
      wayland.windowManager.labwc = lib.mkMerge [
        (import ./themerc.nix {inherit config osConfig;})
        {
          enable = true;
          systemd.enable = true;
          xwayland.enable = true;
        }
        (import ./config {inherit osConfig config lib wallpaperCommand;})
      ];
    }
  ]
