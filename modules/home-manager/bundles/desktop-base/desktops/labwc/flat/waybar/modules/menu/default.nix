''
  "custom/menu": {
    "format" : "{}",
    "tooltip": true,
    "tooltip-format": "Open control panel (Mod+Ctrl+M)",
    "exec-on-event": true,
    "interval": 60,
    "on-click": "bash ${../../../scripts/control-center.sh}; pkill -SIGRTMIN+9 waybar",
    "signal": 9,
    "exec": "bash ${./menu-icon.sh}"
  }
''
