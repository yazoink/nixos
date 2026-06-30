''
  "custom/dnd": {
    "format" : "{}",
    "tooltip": true,
    "tooltip-format": "Do not disturb (Mod+Shift+D)",
    "exec-on-event": true,
    "interval": 3600,
    "on-click": "bash ${../../../../common/scripts/dnd.sh}",
    "signal": 8,
    "exec": "bash ${./dnd-icon.sh}"
  }
''
