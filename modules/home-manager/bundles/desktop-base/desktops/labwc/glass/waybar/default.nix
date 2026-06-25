{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  inherit (osConfig.myOptions.hardwareFeatures) laptop;
  inherit (osConfig.myOptions) desktopTheme;
  iconSize = desktopTheme.fonts.desktop.size - 2;
  barPosition = "bottom";
  notifsModule = ''
    "custom/notification": {
      "tooltip": true,
      "format": "{icon}",
      "format-icons": {
        "notification": "",
        "none": "",
        "dnd-notification": "",
        "dnd-none": "",
        "inhibited-notification": "",
        "inhibited-none": "",
        "dnd-inhibited-notification": "",
        "dnd-inhibited-none": ""
      },
      "return-type": "json",
      "exec-if": "which swaync-client",
      "exec": "swaync-client -swb",
      "on-click": "swaync-client -t -sw",
      "on-click-right": "swaync-client -d -sw",
      "escape": true
    }
  '';
  taskbarModuleLaptop = ''
    "wlr/taskbar": {
      "format": "{icon}",
      "icon-theme": "${config.gtk.iconTheme.name}",
      "icon-size": 18,
      "tooltip-format": "{title}",
      "on-click": "minimize-raise",
      "on-click-middle": "close"
    }
  '';
  taskbarModuleDesktop = ''
    "wlr/taskbar": {
      "format": "{icon} {title:.17}",
      "icon-theme": "${osConfig.desktopTheme.icons.name}",
      "icon-size": 18,
      "tooltip-format": "{title}",
      "on-click": "minimize-raise",
      "on-click-middle": "close",
      "rewrite": {
        " ": "snail man is real"

      }
    }
  '';
  workspacesModule = ''
    "ext/workspaces": {
      "on-click": "activate",
      "sort-by-name": true,
      "active-only": true,
      "tooltip": true,
      "tooltip-format": "Mod + 1-5, or scroll to switch workspaces",
      "on-scroll-up": "${lib.getExe pkgs.wtype} -M win -M ctrl -P left -p left -m ctrl -s 500 -m win",
      "on-scroll-down": "${lib.getExe pkgs.wtype} -M win -M ctrl -P right -p right -m ctrl -s 500 -m win",
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
      "modules": ["custom/workspaces", "ext/workspaces"],
    }
  '';
  clockModule = ''
    "clock": {
      "format": "{:%I:%M %p}",
      "on-click": "bash $EWW_CONFIG_DIR/launch-calendar.sh",
      "tooltip": true,
      "tooltip-format": "Open calendar"
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
      "spacing": 5
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
      "bat": "${laptop.batteryName}",
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
      "bat": "${laptop.batteryName}",
      "interval": 60,
      "states": {
        "warning": 30,
        "critical": 15
      },
      "format": "{capacity}%"
    }
  '';
  volumeModule = ''
    "group/volume-expander": {
      "orientation": "inherit",
      "drawer": {
        "transition-duration": 600,
        "children-class": "tray-group-item"
      },
      "modules": ["wireplumber#icon", "wireplumber#volume"]
    },
    "wireplumber#icon": {
      "format": "{icon}",
      "format-muted": "",
      "on-click-right": "pavucontrol",
      "on-click-middle": "amixer -D pipewire set Master toggle",
      "on-click": "amixer -D pipewire set Master toggle",
      "tooltip-format": "Volume\n- Click to mute\n- Right click to open settings\n- Scroll to adjust",
      "format-icons": [
        "",
        "",
        ""
      ]
    },
    "wireplumber#volume": {
      "on-click-right": "pavucontrol",
      "on-click-middle": "amixer -D pipewire set Master toggle",
      "on-click": "amixer -D pipewire set Master toggle",
      "format": "{volume}%",
      "format-muted": "{volume}%"
    }
  '';
  backlightModule = ''
    "group/backlight-expander": {
      "orientation": "inherit",
      "drawer": {
        "transition-duration": 600,
        "children-class": "tray-group-item"
      },
      "modules": ["custom/backlight-icon", "backlight"]
    },
    "custom/backlight-icon": {
      "format": "",
      "tooltip": true,
      "tooltip-format": "Backlight (scroll to adjust)"
    },
    "backlight": {
      "device": "intel_backlight",
      "format": "{percent}%",
      "tooltip": true,
      "tooltip-format": "Backlight (scroll to adjust)"
    }
  '';
  /*
       powerModule = ''
      "custom/power": {
        "format" : "⏻ ",
          "tooltip": true,
          "tooltip-format": "Power menu",
          "menu": "on-click",
          "menu-file": "~/.config/waybar/menus/power.xml",
          "menu-actions": {
            "lock": "sleep 0.1 && hyprlock",
            "shutdown": "shutdown",
            "reboot": "reboot"
          }
      }
  '';
  */
  powerModule = ''
    "custom/power": {
      "format" : "",
      "tooltip": true,
      "tooltip-format": "Power menu (Mod+Shift+Q)",
      "on-click": "bash $EWW_CONFIG_DIR/launch-power-menu.sh"
    }
  '';
  idleInhibitorModule = ''
    "idle_inhibitor": {
      "format": "{icon}",
      "tooltip": true,
      "tooltip-format-activated": "Idle inhibitor (click to deactivate)",
      "tooltip-format-deactivated": "Idle inhibitor (click to activate)",
      "format-icons": {
        "activated": "",
        "deactivated": ""
      }
    }
  '';
  searchModule = ''
    "custom/search": {
       "format": "",
       "tooltip": true,
       "tooltip-format": "Application menu (Mod+P, Mod+R)",
       "on-click": "${../../common/scripts/wofi.sh}"
    }
  '';
  quickAccessModuleLaptop = ''
    "group/quick-access": {
      "orientation": "inherit",
      "modules": [
      "custom/notification",
      "group/volume-expander",
      "group/backlight-expander",
      "group/battery-expander",
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
  '';
  quickAccessModuleDesktop = ''
    "group/quick-access": {
      "orientation": "inherit",
      "modules": [
      "custom/notification",
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
  '';
  separatorModule = ''
    "custom/separator": {
      "format": "|",
      "tooltip": false
    }
  '';
  barConfig = ''
    "reload_style_on_change": true,
    "layer": "top",
    "mode": "dock",
    "exclusive": "true",
    "position": "${barPosition}",
    "spacing": 4,
    "modules-left": [
      "custom/search",
      "group/workspaces-group",
      "custom/separator",
      "wlr/taskbar"
    ],
    "modules-right": [
      "group/quick-access-slider",
      "clock",
      "custom/power"
    ]
  '';
in {
  home.packages = with pkgs; [waybar font-awesome];
  xdg.configFile = {
    "waybar/config.jsonc".text =
      if laptop.enable
      then ''
        {
          ${barConfig},
          ${workspacesModule},
          ${taskbarModuleLaptop},
          ${volumeModule},
          ${backlightModule},
          ${batteryModule},
          ${trayModule},
          ${searchModule},
          ${powerModule},
          ${separatorModule},
          ${clockModule},
          ${notifsModule},
          ${quickAccessModuleLaptop}
        }
      ''
      else ''
        {
          ${barConfig},
          ${workspacesModule},
          ${taskbarModuleDesktop},
          ${volumeModule},
          ${trayModule},
          ${powerModule},
          ${searchModule},
          ${separatorModule},
          ${clockModule},
          ${notifsModule},
          ${quickAccessModuleDesktop}
        }
      '';
    # "waybar/menus/power.xml".source = ./power.xml;
    "waybar/style.css".text =
      ''
        @define-color bg #${base16Scheme.base00};
        @define-color bg2 #${base16Scheme.base01};
        @define-color bg3 #${base16Scheme.base02};
        @define-color bg4 #${base16Scheme.base03};
        @define-color fg #${base16Scheme.base05};
        @define-color unfocused #${base16Scheme.base04};
        @define-color urgent #${base16Scheme.base08};
        @define-color border #${base16Scheme.base02};
        @define-color accent #${base16Scheme.base0D};
        @define-color yellow #${base16Scheme.base0A};

        * {
          all: unset;
        }

        window#waybar,
        tooltip label,
        menuitem {
          font-family: sans, "Font Awesome 7 Free";
        }

        tooltip label,
        menuitem {
          font-size: ${builtins.toString desktopTheme.fonts.desktop.size}pt;
        }

        #custom-tray-icon,
        #custom-notification,
        #battery.icon,
        #wireplumber.icon,
        #custom-backlight-icon,
        #idle_inhibitor,
        #custom-search,
        #custom-power,
        #custom-left-arrow {
          font-family: "Font Awesome 7 Free";
          font-size: ${builtins.toString iconSize}pt;
        }
      ''
      + builtins.readFile ./style.css;
  };
}
