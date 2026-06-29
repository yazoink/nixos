{
  laptop,
  lib,
  ...
}:
lib.mkMerge [
  (lib.mkIf laptop.enable ''
    "group/quick-access": {
      "orientation": "inherit",
      "modules": [
      "group/volume-expander",
      "group/backlight-expander",
      "group/battery-expander",
      "group/tray-expander"
      ]
    },
    "custom/left-arrow": {
      "format": "",
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
  '')
  (lib.mkIf (laptop.enable == false) ''
    "group/quick-access": {
      "orientation": "inherit",
      "modules": [
      "group/volume-expander",
      "group/tray-expander"
      ]
    },
    "custom/left-arrow": {
      "format": "",
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
  '')
]
