''
  "group/quick-access": {
    "orientation": "inherit",
    "modules": [
    "group/volume-expander",
    "group/tray-expander"
    ]
  },
  "custom/left-arrow": {
    "format" : "{}",
    "exec-on-event": true,
    "on-click": "pkill -SIGRTMIN+10 waybar",
    "signal": 10,
    "exec": "bash ${./arrow.sh}",
    "tooltip": false
  },
  "group/quick-access-slider": {
    "orientation": "inherit",
    "drawer": {
      "click-to-reveal": true,
      "transition-duration": 1000,
      "children-class": "tray-group-item"
    },
    "modules": [
      "custom/left-arrow",
      "group/quick-access"
    ]
  }

''
