{osConfig, ...}: let
  inherit (osConfig.myOptions.userAccount) username;
in [
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
