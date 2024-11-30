# depends on theme module for theming
{config, lib, ...}:
{
  options = {
    bundles.desktopBase.waybar.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  imports = [
    ./cyberia.nix
    ./fluoride.nix
  ];

  config = lib.mkIf config.bundles.desktopBase.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 32;
          spacing = 5;
          modules-left = [
            #"niri/workspaces"
            "hyprland/workspaces"
            "group/usage"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "group/bat"
            "idle_inhibitor"
            "tray"
            "custom/notification"
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
          "niri/workspaces" = {
            format = "{index}";
          };
          "clock" = {
            format = "{:%I:%M %p %d %b %Y}";
            tooltip = false;
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
            spacing = 16;
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
              notification = " ";
              none = " ";
              dnd-notification = " ";
              dnd-none = " ";
              inhibited-notification = " ";
              inhibited-none = " ";
              dnd-inhibited-notification = " ";
              dnd-inhibited-none = " ";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "sleep 0.1 && swaync-client -t -swb";
            escape = true;
          };
        };
      };
      style = with config.stylix.base16Scheme; ''
        * {
          font-family: "${config.stylix.fonts.sansSerif.name}", "Font Awesome 6 Free";
          font-weight: bold;
          font-size: 15px;
          padding: 0px;
          margin: 0px;
        }

        #workspaces button {
          color: #${base05};
          padding-left: 0.5em;
          padding-right: 0.5em;
        }

        #workspaces button:hover {
          background-color: #${base00};
        }

        #memory,
        #cpu,
        #temperature,
        #wireplumber,
        #battery,
        #backlight,
        #tray {
          padding-left: 0.5em;
          padding-right: 0.5em;
        }

        .modules-left #workspaces button.focused,
        .modules-left #workspaces button.active {
          color: #${base0D};
        }

        tooltip {
          background: #${base00};
          border: 1px solid #${base03};
        }

        tooltip label {
          color: #${base05};
        }
      '';
    };
  };
}
