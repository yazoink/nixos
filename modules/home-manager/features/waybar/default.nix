# depends on theme module for theming
{
  config,
  lib,
  osConfig,
  ...
}: let
  #fontSize = osConfig.myOptions.desktopTheme.fonts.desktop.size + 4;
  fontSize = osConfig.myOptions.desktopTheme.fonts.desktop.size;
  inherit (osConfig.myOptions.desktopTheme) smallBars;
in {
  options = {
    bundles.desktopBase.waybar.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  imports = [
    ./desktop.nix
    ./laptop.nix
  ];

  config = lib.mkIf config.bundles.desktopBase.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        waybar = {
          layer = "top";
          position = "top";
          height = 36;
          spacing = 5;
          modules-left = [
            # "group/usage"
            "clock"
          ];
          modules-center = [
            "hyprland/workspaces"
            "sway/workspaces"
          ];
          "group/usage" = {
            orientation = "horizontal";
            modules = [
              "memory"
              "cpu"
              "temperature"
            ];
          };
          "hyprland/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            icon-size = 50;
            sort-by-number = true;
          };
          /*
            "niri/workspaces" = {
            format = "{index}";
          };
          */
          "sway/workspaces" = {
            format = "{index}";
          };
          "clock" = {
            format = "{:%I:%M %p %d %b %Y}";
            tooltip = false;
            #on-click = "gnome-clocks";
          };
          "memory" = {
            interval = 30;
            format = " {used:0.1f}G";
          };
          "cpu" = {
            interval = 10;
            format = " {usage}%";
            max-length = 10;
          };
          "temperature" = {
            format = " {temperatureC}°C";
          };
          "tray" = {
            icon-size = 16;
            spacing = 18;
          };
          "mpd" = {
            format = " {title} - {artist}";
            format-paused = " {title} - {artist}";
            format-stopped = " Nothing playing";
            format-disconnected = " MPD disconnected";
            on-click = "mpc --quiet toggle";
            on-click-right = "mpc update; mpc ls | mpc add";
            on-click-middle = "foot -e ncmpcpp";
            on-scroll-up = "mpc --quiet prev";
            on-scroll-down = "mpc --quiet next";
            smooth-scrolling-threshold = 5;
            tooltip-format = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
          };
          "mpris" = {
            format = "{player_icon} {dynamic}";
            format-paused = "{status_icon} <i>{dynamic}</i>";
            onclick = "play-pause";
            dynamic-order = ["title" "artist"];
            player-icons = {
              default = "▶";
            };
            status-icons = {
              paused = "⏸ ";
            };
            #ignored-players = ["firefox"];
          };
          idle_inhibitor = {
            tooltip-format = "Idle inhibitor";
            format = "{icon}";
            format-icons = {
              activated = " ";
              deactivated = " ";
            };
          };
          "custom/notification" = {
            tooltip = false;
            format = "{icon} ";
            format-icons = {
              notification = "   ";
              none = "   ";
              dnd-notification = "   ";
              dnd-none = "   ";
              inhibited-notification = "   ";
              inhibited-none = "   ";
              dnd-inhibited-notification = "   ";
              dnd-inhibited-none = "   ";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "sleep 0.1 && swaync-client -t -swb";
            escape = true;
          };
          "custom/launcher" = {
            format = "";
            tooltip-format = "Open application launcher";
            on-click =
              if (osConfig.myOptions.bundles.desktopBase.windowManager == "sway")
              then "pkill anyrun || anyrun"
              else "bash ${./scripts/wofi.sh}";
          };
          "custom/mako" = {
            exec-if = "command -v makoctl";
            exec = "bash ${./scripts/mako-icon.sh}";
            exec-on-event = true;
            tooltip-format = "Enable do-not-disturb";
            on-click = "bash ${./scripts/mako.sh}";
            restart-interval = 1;
          };
          "custom/logout" = {
            tooltip-format = "Log out";
            on-click = "pkill simple-logout || simple-logout";
            format = " ";
          };
        };
      };
      style = with config.stylix.base16Scheme;
        builtins.trace "set accent color in waybar" ''
          * {
            font-family: "${config.stylix.fonts.sansSerif.name}", "Font Awesome 6 Free";
            font-weight: bold;
            font-size: ${builtins.toString fontSize}pt;
            padding: 0px;
            margin: 0px;
          }

          #workspaces button:hover {
            background-color: #${base00};
          }

          #memory,
          #cpu,
          #temperature,
          #wireplumber,
          #battery,
          #custom-notification,
          #idle_inhibitor,
          #backlight,
          #custom-mako,
          #custom-logout,
          #clock,
          #tray {
            padding-left: 7px;
            padding-right: 7px;
          }

          #backlight {
            padding-right: 2px;
          }

          #clock {
            padding-left: 10px;
          }

          #tray {
            padding-left: 3px;
          }

          #battery {
            padding-right: 12px;
            padding-left: 8px;
          }

          #custom-logout {
            color: #${base08};
          }

          #custom-mako, #custom-logout {
            padding-left: 3px;
          }

          #custom-launcher {
            padding-left: 10px;
            padding-right: 1px;
          }

          tooltip, #tray menu {
            font-weight: normal;
            background: #${base00};
            border: 1px solid #${base03};
          }

          tooltip label {
            color: #${base05};
          }

          #workspaces button {
            color: #${base03};
            padding-left: 7px;
            padding-right: 7px;
          }

          #workspaces button.focused,
          #workspaces button.active {
            color: #${base05};
          }
        ''
        + (
          if config.bundles.desktopBase.swaync.enable
          then ''
            #idle_inhibitor {
              padding-right: 4px;
            }
          ''
          else ""
        );
    };
  };
}
