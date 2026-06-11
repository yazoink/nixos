{...}: [
  # reconfigure
  {
    "@key" = "W-S-r";
    action = {
      "@name" = "Execute";
      "@command" = "labwc -r; notify-send 'labwc' 'Configuration reloaded'";
    };
  }
  # show desktop
  {
    "@key" = "W-S-d";
    action = {
      "@name" = "ToggleShowDesktop";
    };
  }
]
