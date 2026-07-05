{osConfig, ...}: let
  inherit (osConfig.myOptions.userAccount) username;
in [
  # lock screen
  {
    "@key" = "W-C-l";
    action = {
      "@name" = "Execute";
      "@command" = "hyprlock";
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
]
