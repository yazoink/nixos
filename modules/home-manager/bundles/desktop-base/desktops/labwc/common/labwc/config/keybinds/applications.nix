{
  osConfig,
  wallpaperCommand,
  ...
}: let
  inherit (osConfig.myOptions) defaultApps;
  inherit (osConfig.myOptions.userAccount) username;
in [
  # terminal
  {
    "@key" = "W-Return";
    action = {
      "@name" = "Execute";
      "@command" = "${defaultApps.terminal}";
    };
  }
  # selective screenshot
  {
    "@key" = "W-s";
    action = {
      "@name" = "Execute";
      "@command" = "screenshot -s";
    };
  }
  # fullscreen screenshot
  {
    "@key" = "W-S-s";
    action = {
      "@name" = "Execute";
      "@command" = "screenshot";
    };
  }
  # pick colour
  {
    "@key" = "W-c";
    action = {
      "@name" = "Execute";
      "@command" = "color";
    };
  }
  # launch browser
  {
    "@key" = "W-w";
    action = {
      "@name" = "Execute";
      "@command" = "${defaultApps.webBrowser}";
    };
  }
  # launch file manager
  {
    "@key" = "W-e";
    action = {
      "@name" = "Execute";
      "@command" = "${defaultApps.fileManager}";
    };
  }
  # restart waybar
  {
    "@key" = "W-S-b";
    action = {
      "@name" = "Execute";
      "@command" = "${../../../scripts/waybar.sh}";
    };
  }
  # reset wallpaper
  {
    "@key" = "W-S-w";
    action = {
      "@name" = "Execute";
      "@command" = "${wallpaperCommand} -q";
    };
  }
]
