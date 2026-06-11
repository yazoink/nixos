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
    "@key" = "W-Left";
    action = {
      "@name" = "ResizeRelative";
      "@right" = -10;
    };
  }
  {
    "@key" = "W-Right";
    action = {
      "@name" = "ResizeRelative";
      "@right" = 10;
    };
  }
  {
    "@key" = "W-Up";
    action = {
      "@name" = "ResizeRelative";
      "@down" = -10;
    };
  }
  {
    "@key" = "W-Down";
    action = {
      "@name" = "ResizeRelative";
      "@down" = 10;
    };
  }
  # move window
  {
    "@key" = "W-S-Left";
    action = {
      "@name" = "MoveRelative";
      "@x" = -10;
    };
  }
  {
    "@key" = "W-S-Right";
    action = {
      "@name" = "MoveRelative";
      "@x" = 10;
    };
  }
  {
    "@key" = "W-S-Up";
    action = {
      "@name" = "MoveRelative";
      "@y" = -10;
    };
  }
  {
    "@key" = "W-S-Down";
    action = {
      "@name" = "MoveRelative";
      "@y" = 10;
    };
  }
  # snap to edge
  {
    "@key" = "W-A-Left";
    action = {
      "@direction" = "left";
      "@combine" = "yes";
    };
  }
  {
    "@key" = "W-A-Right";
    action = {
      "@direction" = "right";
      "@combine" = "yes";
    };
  }
  {
    "@key" = "W-A-Up";
    action = {
      "@direction" = "up";
      "@combine" = "yes";
    };
  }
  {
    "@key" = "W-A-Down";
    action = {
      "@direction" = "down";
      "@combine" = "yes";
    };
  }
]
