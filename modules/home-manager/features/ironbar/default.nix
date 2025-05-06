{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  inherit (osConfig.myOptions.userAccount) username;
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
                "type": "custom",
                "class": "search",
                "bar": [
                  {
                    "type": "button",
                    "class": "search-icon",
                    "label": "",
                    "on_click": "!wofi --show drun --location=1 --xoffset=5 --yoffset=5 --prompt 'Start searching or press Esc to exit'",
                    "tooltip": "Open application launcher"
                  }
                ]
              },
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
                    "interval": 1000
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
                    "cmd": "${./scripts/battery_icon.sh}",
                    "mode": "poll",
                    "interval": 10000
                  },
                  {
                    "type": "script",
                    "class": "battery-percent",
                    "show_if": "#show_battery_percent",
                    "cmd": "${./scripts/battery_percent.sh}",
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
              },
              {
                "type": "custom",
                "class": "power",
                "bar": [
                  {
                    "type": "button",
                    "class": "power-icon",
                    "label": "",
                    "on_click": "popup:toggle",
                    "tooltip": "Open power menu"
                  }
                ],
                "popup": [
                  {
                    "orientation": "vertical",
                    "type": "box",
                    "class": "power-popup",
                    "name": "power-popup",
                    "widgets": [
                      {
                        "label": "<span font-weight='bold' font-size='16pt'>Goodbye ${username}</span>",
                        "name": "header",
                        "type": "label"
                      },
                      {
                        "type": "box",
                        "widgets": [
                          {
                            "class": "power-button",
                            "label": "",
                            "on_click": "!shutdown now",
                            "type": "button"
                          },
                          {
                            "class": "power-button",
                            "label": "",
                            "on_click": "!reboot",
                            "type": "button"
                          },
                          {
                            "class": "power-button",
                            "label": "",
                            "on_click": "!hyprlock",
                            "type": "button"
                          }
                        ]
                      },
                      {
                        "name": "uptime",
                        "label": "Uptime: {{30000:${pkgs.procps}/bin/uptime -p | cut -d ' ' -f2-}}",
                        "type": "label"
                      }
                    ]
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
                "type": "custom",
                "class": "search",
                "bar": [
                  {
                    "type": "button",
                    "class": "search-icon",
                    "label": "",
                    "on_click": "!wofi --show drun --location=1 --xoffset=5 --yoffset=5 --prompt 'Start searching or press Esc to exit'",
                    "tooltip": "Open application launcher"
                  }
                ]
              },
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
                    "interval": 1000
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
              },
              {
                "type": "custom",
                "class": "power",
                "bar": [
                  {
                    "type": "button",
                    "class": "power-icon",
                    "label": "",
                    "on_click": "popup:toggle",
                    "tooltip": "Open power menu"
                  }
                ],
                "popup": [
                  {
                    "orientation": "vertical",
                    "type": "box",
                    "class": "power-popup",
                    "name": "power-popup",
                    "widgets": [
                      {
                        "label": "<span font-weight='bold' font-size='16pt'>Goodbye ${username}</span>",
                        "name": "header",
                        "type": "label"
                      },
                      {
                        "type": "box",
                        "widgets": [
                          {
                            "class": "power-button",
                            "label": "",
                            "on_click": "!shutdown now",
                            "type": "button"
                          },
                          {
                            "class": "power-button",
                            "label": "",
                            "on_click": "!reboot",
                            "type": "button"
                          },
                          {
                            "class": "power-button",
                            "label": "",
                            "on_click": "!hyprlock",
                            "type": "button"
                          }
                        ]
                      },
                      {
                        "type": "label"
                        "label": "Uptime: {{30000:${pkgs.procps}/bin/uptime -p | cut -d ' ' -f2-}}",
                        "name": "uptime",
                      }
                    ]
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
          padding-right: 7px;
          padding-left: 7px;
        }

        .popup {
          font-family: "${fonts.sansSerif.name}";
          background-color: #${base16Scheme.base00};
          color: #${base16Scheme.base05};
          padding: 5px;
          border: 1px solid #${base16Scheme.base01};
          border-radius: 10px;
        }

        .power-popup {
          padding: 15px;
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
        .search-icon,
        .brightness-icon,
        .brightness-percent,
        .battery-percent,
        .volume-percent,
        .systray-revealer-icon,
        .power-icon {
          margin: 0;
          background: none;
          padding-left: 7px;
          padding-right: 7px;
        }

        .power-icon {
          color: #${base16Scheme.base08};
        }

        .battery,
        .volume,
        .brightness {
          margin: 0;
          padding: 0;
        }

        .battery-icon,
        .volume-icon,
        .brightness-icon,
        .systray-revealer-icon,
        .search-icon {
          font-size: 16px;
        }

        .battery-percent,
        .volume-percent,
        .brightness-percent {
          margin: 0;
          padding-right: 7px;
          padding-left: 0px;
        }

        .workspaces .item {
          color: #${base16Scheme.base03};
          padding-left: 3px;
          padding-right: 3px;
        }

        .workspaces .item.focused {
          color: #${base16Scheme.base05};
        }

        .power-button {
          font-size: 42pt;
          padding-right: 35px;
          padding-left: 20px;
          margin: 5px;
        }

        .power-popup label {
          padding: 5px;
        }
      '';
    };
  };
}
