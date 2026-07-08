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
  # reload shell
  {
    "@key" = "W-S-y";
    action = {
      "@name" = "Execute";
      "@command" = "yzshell restart";
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
      "@command" = "yzshell update dnd";
    };
  }
  # power menu
  {
    "@key" = "W-S-q";
    action = {
      "@name" = "Execute";
      "@command" = "yzshell toggle power";
    };
  }
  # calendar
  {
    "@key" = "W-S-c";
    action = {
      "@name" = "Execute";
      "@command" = "yzshell toggle calendar";
    };
  }
  # control_center
  {
    "@key" = "W-C-m";
    action = {
      "@name" = "Execute";
      "@command" = "yzshell toggle control_center";
    };
  }
]
