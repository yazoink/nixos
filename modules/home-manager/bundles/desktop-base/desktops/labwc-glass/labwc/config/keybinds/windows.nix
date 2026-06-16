{...}: [
  # close window
  {
    "@key" = "A-F4";
    action = {
      "@name" = "Close";
    };
  }
  {
    "@key" = "W-q";
    action = {
      "@name" = "Close";
    };
  }
  # toggle fullscreen
  {
    "@key" = "W-S-m";
    action = {
      "@name" = "ToggleFullscreen";
    };
  }
  # toggle maximise
  {
    "@key" = "W-m";
    action = {
      "@name" = "ToggleMaximize";
    };
  }
  # toggle pin
  {
    "@key" = "W-x";
    action = {
      "@name" = "ToggleOmnipresent";
    };
  }
  # unsnap
  {
    "@key" = "W-f";
    action = {
      "@name" = "UnSnap";
    };
  }
  # iconify
  {
    "@key" = "W-i";
    action = {
      "@name" = "iconify";
    };
  }
  # cycle focus
  {
    "@key" = "W-Tab";
    action = {
      "@name" = "NextWindow";
      "@workspace" = "current";
      "@output" = "all";
      "@identifier" = "all";
    };
  }
  {
    "@key" = "W-S-Tab";
    action = {
      "@name" = "PreviousWindow";
      "@workspace" = "current";
      "@output" = "all";
      "@identifier" = "all";
    };
  }
  # resize window
  {
    "@key" = "W-S-Left";
    action = {
      "@name" = "ResizeRelative";
      "@right" = -10;
    };
  }
  {
    "@key" = "W-S-Right";
    action = {
      "@name" = "ResizeRelative";
      "@right" = 10;
    };
  }
  {
    "@key" = "W-S-Up";
    action = {
      "@name" = "ResizeRelative";
      "@bottom" = -10;
    };
  }
  {
    "@key" = "W-S-Down";
    action = {
      "@name" = "ResizeRelative";
      "@bottom" = 10;
    };
  }
  # move window
  {
    "@key" = "W-Left";
    action = {
      "@name" = "MoveRelative";
      "@x" = -10;
    };
  }
  {
    "@key" = "W-Right";
    action = {
      "@name" = "MoveRelative";
      "@x" = 10;
    };
  }
  {
    "@key" = "W-Up";
    action = {
      "@name" = "MoveRelative";
      "@y" = -10;
    };
  }
  {
    "@key" = "W-Down";
    action = {
      "@name" = "MoveRelative";
      "@y" = 10;
    };
  }
  # snap to edge
  {
    "@key" = "W-A-Left";
    action = {
      "@name" = "ToggleSnapToEdge";
      "@direction" = "left";
      "@combine" = "yes";
    };
  }
  {
    "@key" = "W-A-Right";
    action = {
      "@name" = "ToggleSnapToEdge";
      "@direction" = "right";
      "@combine" = "yes";
    };
  }
  {
    "@key" = "W-A-Up";
    action = {
      "@name" = "ToggleSnapToEdge";
      "@direction" = "up";
      "@combine" = "yes";
    };
  }
  {
    "@key" = "W-A-Down";
    action = {
      "@name" = "ToggleSnapToEdge";
      "@direction" = "down";
      "@combine" = "yes";
    };
  }
]
