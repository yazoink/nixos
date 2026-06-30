{...}: [
  # reconfigure
  {
    "@key" = "W-S-r";
    action = {
      "@name" = "Execute";
      "@command" = "bash ${../../../scripts/reload-labwc.sh}";
    };
  }
  # toggle keybinds
  {
    "@key" = "W-S-k";
    action = {
      "@name" = "ToggleKeybinds";
    };
  }
  # toggle magnify
  {
    "@key" = "W-A-m";
    action = {
      "@name" = "ToggleMagnify";
    };
  }
  {
    "@key" = "W-equal";
    action = {
      "@name" = "ZoomIn";
    };
  }
  {
    "@key" = "W-minus";
    action = {
      "@name" = "ZoomOut";
    };
  }
]
