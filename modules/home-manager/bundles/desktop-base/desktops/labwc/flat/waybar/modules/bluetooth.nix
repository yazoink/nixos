''
  "custom/bluetooth-icon": {
    "format": "",
    "tooltip": true,
    "tooltip-format": "Backlight (scroll to adjust)"
  },
  "bluetooth": {
    "format": "{status}",
  	"format-disabled": "{status}", // an empty format will hide the module
  	"format-connected": "{num_connections} connected",
  	"tooltip-format": "{controller_alias}\t{controller_address}",
  	"tooltip-format-connected": "{controller_alias}\t{controller_address}\n\n{device_enumerate}",
  	"tooltip-format-enumerate-connected": "{device_alias}\t{device_address}"
  },
  "group/bluetooth-expander": {
    "orientation": "inherit",
    "drawer": {
      "transition-duration": 600,
      "children-class": "tray-group-item"
    },
    "modules": ["custom/bluetooth-icon", "bluetooth"]
  }
''
