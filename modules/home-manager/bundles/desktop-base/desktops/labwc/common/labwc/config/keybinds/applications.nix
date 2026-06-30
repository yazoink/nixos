{
  osConfig,
  wallpaperCommand,
  ...
}: let
  inherit (osConfig.myOptions) defaultApps;
  inherit (osConfig.myOptions.userAccount) username;
in [
  # terminal
  {
    "@key" = "W-Return";
    action = {
      "@name" = "Execute";
      "@command" = "${defaultApps.terminal}";
    };
  }
  # launcher
  {
    "@key" = "W-p";
    action = {
      "@name" = "Execute";
      "@command" = "${../../../scripts/wofi.sh}";
    };
  }
  {
    "@key" = "W-r";
    action = {
      "@name" = "Execute";
      "@command" = "${../../../scripts/wofi.sh}";
    };
  }
  # selective screenshot
  {
    "@key" = "W-s";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../scripts/screenshot} -s";
    };
  }
  # fullscreen screenshot
  {
    "@key" = "W-S-s";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../scripts/screenshot}";
    };
  }
  # lock screen
  {
    "@key" = "W-C-l";
    action = {
      "@name" = "Execute";
      "@command" = "hyprlock";
    };
  }
  # pick colour
  {
    "@key" = "W-c";
    action = {
      "@name" = "Execute";
      "@command" = "${../../../scripts/color.sh}";
    };
  }
  # launch browser
  {
    "@key" = "W-w";
    action = {
      "@name" = "Execute";
      "@command" = "${defaultApps.webBrowser}";
    };
  }
  # launch file manager
  {
    "@key" = "W-e";
    action = {
      "@name" = "Execute";
      "@command" = "${defaultApps.fileManager}";
    };
  }
  # restart waybar
  {
    "@key" = "W-S-b";
    action = {
      "@name" = "Execute";
      "@command" = "${../../../scripts/waybar.sh}";
    };
  }
  # reload eww
  {
    "@key" = "W-S-e";
    action = {
      "@name" = "Execute";
      "@command" = "eww reload";
    };
  }
  # power menu
  {
    "@key" = "W-S-q";
    action = {
      "@name" = "Execute";
      "@command" = "bash /home/${username}/.config/eww/launch-power-menu.sh";
    };
  }
  # calendar
  {
    "@key" = "W-S-c";
    action = {
      "@name" = "Execute";
      "@command" = "bash /home/${username}/.config/eww/launch-calendar.sh";
    };
  }
  # reset wallpaper
  {
    "@key" = "W-S-w";
    action = {
      "@name" = "Execute";
      "@command" = "${wallpaperCommand} -q";
    };
  }
]
