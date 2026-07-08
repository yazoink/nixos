#!/usr/bin/env python

import json
from os import environ

# quick access
quick_access_modules = ["group/volume-expander"]
if environ["WAYBAR_SHOW_BATTERY"] == "True":
    quick_access_modules.append("group/battery-expander")
if environ["WAYBAR_SHOW_BACKLIGHT"] == "True":
    quick_access_modules.append("group/backlight-expander")
quick_access_modules.append("group/tray-expander")

# center modules
center_modules = []
if environ["WM"] == "labwc":
    center_modules = ["wlr/taskbar"]

# waybar
bar = {
    "reload_style_on_change": True,
    "layer": "top",
    "mode": "dock",
    "exclusive": False,
    "position": "bottom",
    "spacing": 4,
    "height": 50,
    "modules-left": [
        "custom/menu",
        "group/workspaces-group"
    ],
    "modules-center": center_modules,
    "modules-right": [
        "group/quick-access-slider",
        "clock"
    ],
    # menu
    "custom/menu": {
        "format" : "{}",
        "tooltip": True,
        "tooltip-format": "Open control panel (Mod+Ctrl+M)",
        "exec-on-event": True,
        "interval": 60,
        "on-click": f"{environ["YZSHELL_CMD"]} toggle control_center",
        "signal": 9,
        "exec": f"{environ["YZSHELL_CMD"]} get 'bar_menu_icon'"
    },
    # workspaces
    "ext/workspaces": {
        "on-click": "activate",
        "sort-by-name": True,
        "active-only": True,
        "tooltip": True,
        "tooltip-format": "Mod + 1-5, or scroll to switch workspaces",
        "on-scroll-up": "wtype -M win -M ctrl -P left -p left -m ctrl -s 500 -m win",
        "on-scroll-down": "wtype -M win -M ctrl -P right -p right -m ctrl -s 500 -m win",
        "format": "{name}"
    },
    "custom/workspaces": {
        "tooltip": True,
        "tooltip-format": "Switch workspaces",
        "format": "",
        "menu": "on-click",
        "menu-file": f"{environ["YZSHELL_WAYBAR_DIR"]}/workspaces.xml",
        "menu-actions": {
            "w-1": "wtype -M win 1 -s 500 -m win",
            "w-2": "wtype -M win 2 -s 500 -m win",
            "w-3": "wtype -M win 3 -s 500 -m win",
            "w-4": "wtype -M win 4 -s 500 -m win",
            "w-5": "wtype -M win 5 -s 500 -m win"
        }
    },
    "group/workspaces-group": {
        "orientation": "inherit",
        "modules": ["custom/workspaces", "ext/workspaces"]
    },
    # taskbar
    "wlr/taskbar": {
        "format": "{icon}",
        #"icon-theme": "Papirus",
        "icon-size": 26,
        "tooltip-format": "{title}",
        "on-click": "minimize-raise",
        "on-click-middle": "close"
    },
    # quick access
    "group/quick-access": {
        "orientation": "inherit",
        "modules": quick_access_modules
    },
    "custom/left-arrow": {
        "format": "",
        "tooltip": False
    },
    "group/quick-access-slider": {
        "orientation": "inherit",
        "drawer": {
            "click-to-reveal": True,
            "transition-duration": 1000,
            "children-class": "tray-group-item"
        },
        "modules": [
            "custom/left-arrow",
            "group/quick-access"
        ]
    },
    # volume
    "group/volume-expander": {
        "orientation": "inherit",
        "drawer": {
            "transition-duration": 600,
            "children-class": "tray-group-item"
        },
        "modules": ["wireplumber#icon", "wireplumber#volume"]
    },
    "wireplumber#icon": {
        "format": "{icon}",
        "format-muted": "",
        "on-click-right": "pavucontrol",
        "on-click-middle": "amixer -D pipewire set Master toggle",
        "on-click": "amixer -D pipewire set Master toggle",
        "tooltip-format": "Volume\\n- Click to mute\\n- Right click to open settings\\n- Scroll to adjust",
        "format-icons": [
            "",
            "",
            ""
        ]
    },
    "wireplumber#volume": {
        "on-click-right": "pavucontrol",
        "on-click-middle": "amixer -D pipewire set Master toggle",
        "on-click": "amixer -D pipewire set Master toggle",
        "format": "{volume}%",
        "format-muted": "{volume}%"
    },
  # battery
    "group/battery-expander": {
        "orientation": "inherit",
        "drawer": {
            "transition-duration": 600,
            "children-class": "tray-group-item"
        },
        "modules": ["battery#icon", "battery#percentage"]
    },
    "battery#icon": {
        "bat": f"{environ["BATTERY_NAME"]}",
        "interval": 60,
        "tooltip-format": "Battery",
        "states": {
            "warning": 30,
            "critical": 15
        },
        "format-icons": ["", "", "", "", ""],
        "format": "{icon}",
        "format-charging": ""
    },
    "battery#percentage": {
        "bat": f"{environ["BATTERY_NAME"]}",
        "interval": 60,
        "states": {
            "warning": 30,
            "critical": 15
        },
        "format": "{capacity}%"
    },
    #backlight
    "group/backlight-expander": {
        "orientation": "inherit",
        "drawer": {
            "transition-duration": 600,
            "children-class": "tray-group-item"
        },
        "modules": ["custom/backlight-icon", "backlight"]
    },
    "custom/backlight-icon": {
        "format": "",
        "tooltip": True,
        "tooltip-format": "Backlight (scroll to adjust)"
    },
    "backlight": {
        "device": "intel_backlight",
        "format": "{percent}%",
        "tooltip": True,
        "tooltip-format": "Backlight (scroll to adjust)"
    },
    # tray
    "group/tray-expander": {
        "orientation": "inherit",
        "drawer": {
            "transition-duration": 600,
            "children-class": "tray-group-item"
        },
        "modules": ["custom/tray-icon", "tray"]
    },
    "custom/tray-icon": {
        "format": "",
        "tooltip": True,
        "tooltip-format": "Systray"
    },
    "tray": {
        "icon-size": 15,
        "spacing": 4
    },
    # clock
    "clock": {
        "format": "{:%I:%M %p}",
        "on-click": f"{environ["YZSHELL_CMD"]} toggle calendar",
        "tooltip": True,
        "tooltip-format": "Open calendar (Mod+Shift+C)"
    }
}

j = json.dumps(bar)
dest = f"{environ["YZSHELL_WAYBAR_DIR"]}/config.jsonc"
with open(dest, "w") as f:
    f.write(j)