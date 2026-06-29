''
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
    "tooltip-format": "Volume\n- Click to mute\n- Right click to open settings\n- Scroll to adjust",
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
  }
''
