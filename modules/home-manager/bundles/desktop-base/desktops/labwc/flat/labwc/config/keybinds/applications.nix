{...}: [
  /*
    {
    "@key" = "Escape";
    action = {
      "@name" = "Execute";
      "@command" = "eww update control_center_visible=false";
      "@onRelease" = true;
    };
  }
  */
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
  # reload eww
  {
    "@key" = "W-S-e";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../scripts/launch-eww.sh} notify";
    };
  }
  # lock screen
  {
    "@key" = "W-C-l";
    action = {
      "@name" = "Execute";
      # "@command" = "lock";
      "@command" = "hyprlock";
    };
  }
  # do not disturb
  {
    "@key" = "W-S-d";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../scripts/dnd.sh}";
    };
  }
  # power menu
  {
    "@key" = "W-S-q";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../scripts/power.sh}";
    };
  }
  # calendar
  {
    "@key" = "W-S-c";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../scripts/calendar.sh}";
    };
  }
  # calendar
  {
    "@key" = "W-C-m";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../scripts/control-center.sh}";
    };
  }
]
