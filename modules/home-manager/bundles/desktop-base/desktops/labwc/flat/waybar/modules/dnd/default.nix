''
  "custom/dnd": {
    "format" : "{}",
    "tooltip": true,
    "tooltip-format": "Do not disturb (Mod+Shift+D)",
    "exec-on-event": true,
    "interval": 60,
    "on-click": "bash ${../../../../common/scripts/dnd.sh}; pkill -SIGRTMIN+8 waybar",
    "signal": 8,
    "exec": "bash ${./dnd-icon.sh}"
  }
''
