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
  iconSize = desktopTheme.fonts.desktop.size - 1;
  barHeight = 42;
  barPosition = "bottom";
  workspacesModule = ''
    "hyprland/workspaces": {
      "on-click": "activate",
      "format": "{icon}"
    }
  '';
  clockModule = ''
    "group/datetime": {
      "orientation": "vertical",
      "modules": ["clock#time", "clock#date"]
    },
    "clock#time": {
      "format": "{:%I:%M %p}",
      "tooltip": false
    },
    "clock#date": {
      "format": "{:%b %d %Y}",
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
      "on-click": "bash ~/.config/widgets/launch-power-menu.sh"
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
       "on-click": "pkill walker || walker"
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
    "spacing": 15,
    "height": ${builtins.toString barHeight},
    "modules-left": ["custom/search", "hyprland/workspaces"]
  '';
in {
  options = {
    bundles.desktopBase.waybar.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.waybar.enable {
    home.packages = with pkgs; [waybar font-awesome];
    xdg.configFile = {
      "waybar/config.jsonc".text =
        if laptop.enable
        then ''
          {
            ${barConfig},
            "modules-right": [
              "group/volume-expander",
              "group/backlight-expander",
              "group/battery-expander",
              "group/tray-expander",
              "group/datetime",
              "custom/separator",
              "custom/power"
            ],
            ${workspacesModule},
            ${clockModule},
            ${volumeModule},
            ${backlightModule},
            ${batteryModule},
            ${trayModule},
            ${searchModule},
            ${separatorModule},
            ${powerModule}
          }
        ''
        else ''
          {
            ${barConfig},
            "modules-right": [
              "group/volume-expander",
              "group/tray-expander",
              "group/datetime",
              "custom/separator",
              "custom/power"
            ],
            ${workspacesModule},
            ${clockModule},
            ${volumeModule},
            ${trayModule},
            ${idleInhibitorModule},
            ${powerModule}
          }
        '';
      # "waybar/menus/power.xml".source = ./power.xml;
      "waybar/style.css".text =
        ''
          @define-color bg #${base16Scheme.base00};
          @define-color bg2 #${base16Scheme.base02};
          @define-color fg #${base16Scheme.base05};
          @define-color unfocused #${base16Scheme.base03};
          @define-color urgent #${base16Scheme.base08};
          @define-color border #${base16Scheme.base01};

          * {
            all: unset;
          }

          window#waybar,
          tooltip label,
          menuitem {
            font-family: ${fonts.sansSerif.name}, "Font Awesome 7 Free";
          }

          window#waybar {
            font-size: ${builtins.toString desktopTheme.fonts.desktop.size}pt;
          }

          tooltip label,
          menuitem {
            font-size: ${builtins.toString desktopTheme.fonts.desktop.size}pt;
          }

          #custom-tray-icon,
          #battery.icon,
          #wireplumber.icon,
          #custom-backlight-icon,
          #idle_inhibitor,
          #custom-power {
            font-size: ${builtins.toString iconSize}pt;
          }
        ''
        + builtins.readFile ./style.css;
    };
  };
}
