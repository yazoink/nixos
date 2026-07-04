{...}: [
  # do not disturb
  {
    "@key" = "W-S-d";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../../common/scripts/dnd.sh}";
    };
  }
  # power menu
  {
    "@key" = "W-S-q";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../../common/scripts/power.sh}";
    };
  }
  # calendar
  {
    "@key" = "W-S-c";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../../common/scripts/calendar.sh}";
    };
  }
  # calendar
  {
    "@key" = "W-C-m";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../../common/scripts/control-panel.sh}";
    };
  }
]
