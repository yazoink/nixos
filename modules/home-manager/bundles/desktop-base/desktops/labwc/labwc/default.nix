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
    then "${../scripts/swaybg.sh} -c ${desktopTheme.wallpaper.color.hex}"
    else
      (
        if (osConfig.myOptions.desktopTheme.wallpaper.image.fillType == "fill")
        then "${../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.image.path}"
        else "${../scripts/swaybg.sh} -t ${desktopTheme.wallpaper.image.path}"
      );
in
  lib.mkMerge [
    (import ./themerc.nix {inherit config osConfig;})
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
      systemd.user.services.labwc-menu-gen = {
        Unit = {
          Description = "Generates labwc root menu";
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${lib.getExe pkgs.labwc-menu-generator} > /home/${osConfig.myOptions.userAccount.username}/.config/labwc/menu.xml";
        };
        Install = {
          WantedBy = ["default.target"];
        };
      };
      wayland.windowManager.labwc = lib.mkMerge [
        {
          enable = true;
          systemd = {
            enable = true;
            extraCommands = [
              "systemctl --user stop labwc-session.target"
              "systemctl --user start labwc-session.target"
            ];
          };
          xwayland.enable = true;
        }
        (import ./config {inherit osConfig config lib wallpaperCommand;})
      ];
    }
  ]
