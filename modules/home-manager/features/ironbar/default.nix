# I know this is awful but it works
{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  iconTheme =
    if (config.stylix.polarity == "dark")
    then config.stylix.iconTheme.dark
    else config.stylix.iconTheme.light;
in {
  options = {
    bundles.desktopBase.ironbar.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.ironbar.enable {
    home.packages = with pkgs; [ironbar];
    xdg.configFile = {
      "ironbar/config.json".text =
        if osConfig.myOptions.hardwareFeatures.laptop.enable
        then ''
          {
            "position": "top",
            "anchor_to_edges": true,
            "icon_theme": "${iconTheme}",
            "height": 36,
            "start": [
              {
                "type": "workspaces",
                "all_monitors": false,
                "tooltip": "Workspaces",
                "hidden": [
                  "special:special"
                ]
              }
            ],
            "center": [
              {
                "type": "label",
                "class": "clock",
                "label": "{{10000:date '+%I:%M %p %d %b %Y'}}"
              }
            ],
            "end": [
              {
                "type": "custom",
                "class": "volume",
                "on_mouse_enter": "ironbar var set show_volume_percent true",
                "on_mouse_exit": "ironbar var set show_volume_percent false",
                "on_click_left": "amixer set Master toggle",
                "on_click_right": "pavucontrol",
                "on_scroll_up": "amixer set Master 1%+",
                "on_scroll_down": "amixer set Master 1%-",
                "tooltip": "Volume\n- Scroll to change\n- Left click to mute\n- Right click to open settings",
                "bar": [
                  {
                    "type": "volume",
                    "class": "volume-icon",
                    "format": "{icon}"
                  },
                  {
                    "type": "volume",
                    "class": "volume-percent",
                    "show_if": "#show_volume_percent",
                    "format": "{percentage}%"
                  }
                ]
              },
              {
                "type": "custom",
                "class": "brightness",
                "on_mouse_enter": "ironbar var set show_brightness_percent true",
                "on_mouse_exit": "ironbar var set show_brightness_percent false",
                "on_scroll_up": "brightnessctl -s set +1%",
                "on_scroll_down": "brightnessctl -s set 1%-",
                "tooltip": "Brightness\n- Scroll to change",
                "bar": [
                  {
                    "type": "script",
                    "class": "brightness-icon",
                    "cmd": "${./scripts/brightness_icon.sh}",
                    "mode": "poll",
                    "interval": 1000
                  },
                  {
                    "type": "script",
                    "class": "brightness-percent",
                    "show_if": "#show_brightness_percent",
                    "cmd": "${./scripts/brightness_percent.sh}",
                    "mode": "poll",
                    "interval": 1000
                  }
                ]
              },
              {
                "type": "custom",
                "class": "battery",
                "on_mouse_enter": "ironbar var set show_battery_percent true",
                "on_mouse_exit": "ironbar var set show_battery_percent false",
                "tooltip": "Battery",
                "bar": [
                  {
                    "type": "script",
                    "class": "battery-icon",
                    "cmd": "${./scripts/battery_icon.sh} ${osConfig.myOptions.hardwareFeatures.laptop.batteryName}",
                    "mode": "poll",
                    "interval": 10000
                  },
                  {
                    "type": "script",
                    "class": "battery-percent",
                    "show_if": "#show_battery_percent",
                    "cmd": "echo \"$(cat /sys/class/power_supply/${osConfig.myOptions.hardwareFeatures.laptop.batteryName}/capacity)%\"",
                    "mode": "poll",
                    "interval": 10000
                  }
                ]
              },
              {
                "type": "custom",
                "class": "systray",
                "on_mouse_enter": "ironbar var set show_systray true",
                "on_mouse_exit": "ironbar var set show_systray false",
                "tooltip": "Systray",
                "bar": [
                  {
                    "type": "label",
                    "class": "systray-revealer-icon",
                    "label": ""
                  },
                  {
                    "type": "tray",
                    "show_if": "#show_systray",
                    "icon_size": 16
                  }
                ]
              }
            ]
          }
        ''
        else ''
          {
            "position": "top",
            "anchor_to_edges": true,
            "icon_theme": "${iconTheme}",
            "height": 36,
            "start": [
              {
                "type": "workspaces",
                "all_monitors": false,
                "tooltip": "Workspaces",
                "hidden": [
                  "special:special"
                ]
              }
            ],
            "center": [
              {
                "type": "label",
                "class": "clock",
                "label": "{{10000:date '+%I:%M %p %d %b %Y'}}"
              }
            ],
            "end": [
              {
                "type": "custom",
                "class": "volume",
                "on_mouse_enter": "ironbar var set show_volume_percent true",
                "on_mouse_exit": "ironbar var set show_volume_percent false",
                "on_click_left": "amixer set Master toggle",
                "on_click_right": "pavucontrol",
                "on_scroll_up": "amixer set Master 1%+",
                "on_scroll_down": "amixer set Master 1%-",
                "tooltip": "Volume\n- Scroll to change\n- Left click to mute\n- Right click to open settings",
                "bar": [
                  {
                    "type": "script",
                    "class": "volume-icon",
                    "cmd": "${./scripts/volume_icon.sh}",
                    "mode": "poll",
                    "interval": 700
                  },
                  {
                    "type": "script",
                    "class": "volume-percent",
                    "show_if": "#show_volume_percent",
                    "cmd": "amixer sget Master | awk -F\"[][]\" '/Left:/ { print $2 }'",
                    "mode": "poll",
                    "interval": 1000
                  }
                ]
              },
              {
                "type": "custom",
                "class": "systray",
                "on_mouse_enter": "ironbar var set show_systray true",
                "on_mouse_exit": "ironbar var set show_systray false",
                "tooltip": "Systray",
                "bar": [
                  {
                    "type": "label",
                    "class": "systray-revealer-icon",
                    "label": ""
                  },
                  {
                    "type": "tray",
                    "show_if": "#show_systray",
                    "icon_size": 16
                  }
                ]
              }
            ]
          }
        '';
      "ironbar/style.css".text = ''
        .background {
          background: none;
        }

        #bar {
          all: unset;
          font-family: "${fonts.sansSerif.name}", "Font Awesome 6 Free";
          font-weight: bold;
          background-color: #${base16Scheme.base00};
          color: #${base16Scheme.base05};
          padding-right: 5px;
          padding-left: 5px;
        }

        .popup {
          font-family: "${fonts.sansSerif.name}";
          background-color: #${base16Scheme.base00};
          color: #${base16Scheme.base05};
          padding: 5px;
          border: 1px solid #${base16Scheme.base01};
          border-radius: 10px;
        }

        tooltip.background,
        menu {
          background-color: #${base16Scheme.base00};
          color: #${base16Scheme.base05};
          border: 1px solid #${base16Scheme.base01};
          border-radius: 10px;
        }

        tooltip label {
          color: #${base16Scheme.base05};
        }

        .workspaces {
          margin: 0;
          padding: 0;
        }

        .clock,
        .workspaces .item,
        .tray,
        .script,
        .battery-icon,
        .volume-icon,
        .brightness-icon,
        .brightness-percent,
        .battery-percent,
        .volume-percent,
        .systray-revealer-icon {
          margin: 0;
          background: none;
          padding-left: 10px;
          padding-right: 10px;
        }

        .battery,
        .volume,
        .brightness {
          margin: 0;
          padding: 0;
        }

        .battery-icon,
        .volume-icon label,
        .brightness-icon,
        .systray-revealer-icon {
          font-size: 16px;
        }

        .battery-percent,
        .volume-percent,
        .brightness-percent,
        .tray {
          margin: 0;
          padding-right: 10px;
          padding-left: 0px;
        }

        .workspaces .item {
          color: #${base16Scheme.base03};
          padding-left: 3px;
          padding-right: 10px;
        }

        .workspaces .item.focused {
          color: #${base16Scheme.base05};
        }
      '';
    };
  };
}
