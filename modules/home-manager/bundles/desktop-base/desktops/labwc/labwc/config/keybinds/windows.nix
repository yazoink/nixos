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
]
