{config, ...}: ''
  "wlr/taskbar": {
    "format": "{icon}",
    "icon-theme": "${config.gtk.iconTheme.name}",
    "icon-size": 26,
    "tooltip-format": "{title}",
    "on-click": "minimize-raise",
    "on-click-middle": "close"
  }
''
