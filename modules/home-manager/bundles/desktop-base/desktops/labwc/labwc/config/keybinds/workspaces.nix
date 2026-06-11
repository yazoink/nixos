{...}: [
  # switch to workspace
  {
    "@key" = "W-1";
    action = {
      "@name" = "GoToDesktop";
      "@to" = 1;
    };
  }
  {
    "@key" = "W-2";
    action = {
      "@name" = "GoToDesktop";
      "@to" = 2;
    };
  }
  {
    "@key" = "W-3";
    action = {
      "@name" = "GoToDesktop";
      "@to" = 3;
    };
  }
  {
    "@key" = "W-4";
    action = {
      "@name" = "GoToDesktop";
      "@to" = 4;
    };
  }
  {
    "@key" = "W-5";
    action = {
      "@name" = "GoToDesktop";
      "@to" = 5;
    };
  }
  # send to workspace
  {
    "@key" = "W-S-1";
    action = {
      "@name" = "SendToDesktop";
      "@to" = 1;
    };
  }
  {
    "@key" = "W-S-2";
    action = {
      "@name" = "SendToDesktop";
      "@to" = 2;
    };
  }
  {
    "@key" = "W-S-3";
    action = {
      "@name" = "SendToDesktop";
      "@to" = 3;
    };
  }
  {
    "@key" = "W-S-4";
    action = {
      "@name" = "SendToDesktop";
      "@to" = 4;
    };
  }
  {
    "@key" = "W-S-5";
    action = {
      "@name" = "SendToDesktop";
      "@to" = 5;
    };
  }
  # show next/prev workspace
  {
    "@key" = "W-C-Left";
    action = {
      "@name" = "GoToDesktop";
      "@to" = "left";
      "@wrap" = "yes";
      "@toggle" = "no";
    };
  }
  {
    "@key" = "W-C-Right";
    action = {
      "@name" = "GoToDesktop";
      "@to" = "right";
      "@wrap" = "yes";
      "@toggle" = "no";
    };
  }
]
