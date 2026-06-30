{
  lib,
  pkgs,
  ...
}: ''
  "ext/workspaces": {
    "on-click": "activate",
    "sort-by-name": true,
    "active-only": true,
    "tooltip": true,
    "tooltip-format": "Mod + 1-5, or scroll to switch workspaces",
    "on-scroll-up": "${lib.getExe pkgs.wtype} -M win -M ctrl -P left -p left -m ctrl -s 500 -m win",
    "on-click-right": "${lib.getExe pkgs.wtype} -M win -M ctrl -P left -p left -m ctrl -s 500 -m win",
    "on-scroll-down": "${lib.getExe pkgs.wtype} -M win -M ctrl -P right -p right -m ctrl -s 500 -m win",
    "on-click": "${lib.getExe pkgs.wtype} -M win -M ctrl -P right -p right -m ctrl -s 500 -m win",
    "format": "{name}"
  },
  "custom/workspaces": {
    "tooltip": true,
    "tooltip-format": "Switch workspaces",
    "format": "",
    "menu": "on-click",
    "menu-file": "${./workspaces.xml}",
    "menu-actions": {
      "w-1": "${lib.getExe pkgs.wtype} -M win 1 -s 500 -m win",
      "w-2": "${lib.getExe pkgs.wtype} -M win 2 -s 500 -m win",
      "w-3": "${lib.getExe pkgs.wtype} -M win 3 -s 500 -m win",
      "w-4": "${lib.getExe pkgs.wtype} -M win 4 -s 500 -m win",
      "w-5": "${lib.getExe pkgs.wtype} -M win 5 -s 500 -m win"
    }
  },
  "group/workspaces-group": {
    "orientation": "inherit",
    "modules": ["custom/workspaces", "ext/workspaces"]
  }
''
