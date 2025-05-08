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
  barHeight = 36;
  workspacesModule = ''
    {
      "type": "workspaces",
      "all_monitors": false,
      "tooltip": "Workspaces",
      "hidden": [
        "special:special"
      ]
    }
  '';
  clockModule = ''
    {
      "type": "label",
      "class": "clock",
      "label": "{{10000:date '+%I:%M %p %d %b %Y'}}"
    }
  '';
  volumeModule = ''
    {
      "type": "custom",
      "class": "volume",
      "on_mouse_enter": "ironbar var set show_volume_percent true",
      "on_mouse_exit": "ironbar var set show_volume_percent false",
      "on_click_left": "amixer set Master toggle",
      "on_click_middle": "amixer set Master toggle",
      "on_click_right": "pavucontrol",
      "on_scroll_up": "amixer set Master 1%+",
      "on_scroll_down": "amixer set Master 1%-",
      "tooltip": "Volume\n- Scroll to change\n- Left click the icon to toggle mute\n- Left click the number to open popup\n- Middle click to toggle mute\n- Right click to open settings",
      "bar": [
        {
          "type": "script",
          "class": "volume-icon",
          "cmd": "${./scripts/volume_icon.sh}",
          "mode": "poll",
          "interval": 1500
        },
        {
          "type": "volume",
          "class": "volume-percent",
          "show_if": "#show_volume_percent",
          "format": "{percentage}%"
        }
      ]
    }
  '';
  systrayModule = ''
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
  '';
  networkModule = ''
    {
      "type": "network_manager",
      "icon_size": 16
    }
  '';
  powerModule = ''
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
              "label": "<span font-weight='bold' font-size='16pt'>Have a nice day!</span>",
              "name": "header",
              "type": "label"
            },
            {
              "type": "box",
              "class": "power-button-box",
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
              "class": "uptime",
              "label": "Uptime: {{30000:${pkgs.procps}/bin/uptime -p | cut -d ' ' -f2-}}",
              "type": "label"
            }
          ]
        }
      ]
    }
  '';
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
            "height": ${builtins.toString barHeight},
            "start": [
              ${workspacesModule}
            ],
            "center": [
              ${clockModule}
            ],
            "end": [
              ${volumeModule},
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
                    "type": "label",
                    "class": "brightness-icon",
                    "label": ""
                  },
                  {
                    "type": "script",
                    "class": "brightness-percent",
                    "show_if": "#show_brightness_percent",
                    "cmd": "${./scripts/brightness.py}",
                    "mode": "watch",
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
                    "interval": 25000
                  },
                  {
                    "type": "script",
                    "class": "battery-percent",
                    "show_if": "#show_battery_percent",
                    "cmd": "echo \"$(cat /sys/class/power_supply/${osConfig.myOptions.hardwareFeatures.laptop.batteryName}/capacity)%\"",
                    "mode": "poll",
                    "interval": 25000
                  }
                ]
              },
              ${systrayModule},
              ${powerModule}
            ]
          }
        ''
        else ''
          {
            "position": "top",
            "anchor_to_edges": true,
            "icon_theme": "${iconTheme}",
            "height": ${builtins.toString barHeight},
            "start": [
              ${workspacesModule}
            ],
            "center": [
              ${clockModule}
            ],
            "end": [
              ${volumeModule},
              ${systrayModule},
              ${powerModule}
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
          padding-left: 10px;
        }

        .popup {
          font-family: "${fonts.sansSerif.name}";
          background-color: #${base16Scheme.base00};
          color: #${base16Scheme.base05};
          padding: 15px;
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
          padding-left: 0;
        }

        .clock,
        .workspaces .item,
        .tray,
        .script,
        .battery-icon,
        .power-icon,
        .volume-icon,
        .brightness-icon,
        .brightness-percent,
        .battery-percent,
        .volume-percent,
        .network_manager,
        .systray-revealer-icon {
          margin: 0;
          background: none;
          padding-left: 10px;
          padding-right: 10px;
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

        .power-button {
          font-size: 42pt;
          padding-right: 35px;
          padding-left: 20px;
          margin: 5px;
        }

        .power-button-box {
          margin-top: 10px;
          margin-bottom: 10px;
        }
        .popup-music .album-art {
            margin-right: 1em;
        }

        .popup-music .icon-box {
            margin-right: 0.4em;
        }

        .popup-music .title .icon, .popup-music .title .label {
            font-size: 1.7em;
        }

        .popup-music .volume .slider slider {
            border-radius: 100%;
        }

        .popup-music .volume .icon {
            margin-left: 4px;
        }

        .popup-music .progress .slider slider {
            border-radius: 100%;
        }

        scale trough, scale slider {
            min-width: 5px;
            min-height: 5px;
        }

        .popup-volume .device-box .btn-mute,
        .popup-volume .apps-box .app-box .btn-mute {
          font-size: 24px;
        }
      '';
    };
  };
}
