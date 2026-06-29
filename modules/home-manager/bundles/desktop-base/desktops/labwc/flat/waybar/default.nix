{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
  inherit (config.gtk) font;
  inherit (osConfig.myOptions.hardwareFeatures) laptop;
  iconSize = font.size - 2;
  barHeight = 46;
  barPosition = "bottom";
  taskbarModule = import ./modules/taskbar.nix {inherit config;};
  workspacesModule = import ./modules/workspaces {inherit lib pkgs;};
  clockModule = import ./modules/clock.nix;
  trayModule = import ./modules/tray.nix;
  batteryModule = import ./modules/battery.nix {inherit (laptop) batteryName;};
  volumeModule = import ./modules/volume.nix;
  backlightModule = import ./modules/backlight.nix;
  powerModule = import ./modules/power.nix;
  idleInhibitorModule = import ./modules/idle-inhibitor.nix;
  searchModule = import ./modules/search.nix;
  quickAccessModule =
    if laptop.enable
    then import ./modules/quick-access/laptop.nix
    else import ./modules/quick-access/desktop.nix;
  separatorModule = import ./modules/separator.nix;
  barConfig = ''
    "reload_style_on_change": true,
    "layer": "top",
    "mode": "dock",
    "exclusive": false,
    "position": "${barPosition}",
    "spacing": 4,
    "height": ${builtins.toString barHeight},
    "modules-left": [
      "custom/search",
      "group/workspaces-group"
    ],
    "modules-center": [
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
    "waybar/config.jsonc".text = ''
      {
        ${barConfig},
        ${workspacesModule},
        ${taskbarModule},
        ${volumeModule},
        ${backlightModule},
        ${batteryModule},
        ${trayModule},
        ${searchModule},
        ${powerModule},
        ${clockModule},
        ${quickAccessModule}
      }
    '';
    # "waybar/menus/power.xml".source = ./power.xml;
    "waybar/style.css".text = with colors;
      ''
        @define-color bg #${base00};
        @define-color bg2 rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.09);
        @define-color fg #${base05};
        @define-color unfocused #${base04};
        @define-color urgent #${base08};
        @define-color border #${base02};
        @define-color accent #${base0D};

        * {
          all: unset;
        }

        window#waybar,
        tooltip label,
        menuitem {
          font-family: ${font.name}, "Font Awesome 7 Free";
        }

        window#waybar {
          font-size: ${builtins.toString font.size}pt;
        }

        tooltip label,
        menuitem {
          font-size: ${builtins.toString font.size}pt;
        }

        #custom-tray-icon,
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
