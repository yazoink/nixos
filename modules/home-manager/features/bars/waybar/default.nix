{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  inherit (osConfig.myOptions.hardwareFeatures.laptop) batteryName;
  barHeight = 36;
  barPosition = "top";
  workspacesModule = ''
    "hyprland/workspaces": {
      "on-click": "activate",
      "format": "{icon}"
    }
  '';
  clockModule = ''
    "clock": {
      "format": "{:%I:%M %p %b %d %Y}",
      "tooltip": false
    }
  '';
  trayModule = ''
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
      "tooltip": true,
      "tooltip-format": "Systray"
    },
    "tray": {
      "icon-size": 16,
      "spacing": 17
    }
  '';
  batteryModule = ''
    "group/battery-expander": {
      "orientation": "inherit",
      "drawer": {
        "transition-duration": 600,
        "children-class": "tray-group-item"
      },
      "modules": ["battery#icon", "battery#percentage"]
    },
    "battery#icon": {
      "bat": "BAT1",
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
      "bat": "BAT1",
      "interval": 60,
      "states": {
        "warning": 30,
        "critical": 15
      },
      "format": "{capacity}%"
    }
  '';
in {}
