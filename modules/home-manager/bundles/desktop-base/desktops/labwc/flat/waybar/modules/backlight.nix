''
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
    "tooltip": true,
    "tooltip-format": "Backlight (scroll to adjust)"
  },
  "backlight": {
    "device": "intel_backlight",
    "format": "{percent}%",
    "tooltip": true,
    "tooltip-format": "Backlight (scroll to adjust)"
  }
''
