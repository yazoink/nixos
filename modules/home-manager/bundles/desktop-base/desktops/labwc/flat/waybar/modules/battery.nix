{batteryName, ...}: ''
  "group/battery-expander": {
    "orientation": "inherit",
    "drawer": {
      "transition-duration": 600,
      "children-class": "tray-group-item"
    },
    "modules": ["battery#icon", "battery#percentage"]
  },
  "battery#icon": {
    "bat": "${batteryName}",
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
    "bat": "${batteryName}",
    "interval": 60,
    "states": {
      "warning": 30,
      "critical": 15
    },
    "format": "{capacity}%"
  }
''
