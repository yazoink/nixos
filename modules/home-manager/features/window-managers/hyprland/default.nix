{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}: let
  inherit (osConfig.myOptions.desktopTheme) smallBars;
  closeButtonColor =
    if (osConfig.myOptions.desktopTheme.name == "caroline")
    then config.stylix.base16Scheme.base0E
    else config.stylix.base16Scheme.base08;
  wallpaperCommand =
    if osConfig.myOptions.desktopTheme.wallpaper.solidColor.enable
    then "${../scripts/swaybg.sh} -c ${osConfig.myOptions.desktopTheme.wallpaper.solidColor.hex}"
    else "${../scripts/swaybg.sh} -i ${osConfig.myOptions.desktopTheme.wallpaper.image}";
in {
  imports = [
    ./hypridle.nix
  ];
  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    stylix.targets.hyprland.enable = false;

    bundles.desktopBase = {
      mako.enable = true;
      #swaync.enable = true;
      #rofi.enable = true;
      wofi.enable = true;
      waybar.enable = true;
      screenshot.enable = true;
      simpleLogout.enable = true;
      hyprViewBinds.enable = true;
    };

    home = {
      file.".config/hypr/scripts".source = ../scripts;
    };

    wayland.windowManager.hyprland = builtins.trace "hyprland config module enabled" {
      enable = true;
      xwayland.enable = true;
      systemd.enable = false;
      plugins = with pkgs; [
        # hyprlandPlugins.hyprspace
        #hyprlandPlugins.hypr-dynamic-cursors
        #hyprscroller
        hyprlandPlugins.hyprbars
      ];
      settings = {
        "$terminal" = "${osConfig.myOptions.defaultApps.terminal.command}";
        "$browser" = "${osConfig.myOptions.defaultApps.webBrowser.command}";
        "$fileManager" = "${osConfig.myOptions.defaultApps.fileManager.command}";
        "$menu" = "pkill wofi || wofi --show drun";
        "$screenshot" = "${config.bundles.desktopBase.screenshot.package}/bin/screenshot -s";
        "$power" = "simple-logout";
        "$lock" = "gtklock";
        "$colorPicker" = "${../scripts/color.sh}";
        "$bar" = "${../scripts/waybar.sh}";
        "$screenRecorder" = "kooha";
        "$mainMod" = "SUPER";
        "$wallpaper" = wallpaperCommand;
        env = [
          "NIXOS_OZONE_WL,1"
          "MOZ_ENABLE_WAYLAND,1"
          "GDK_BACKEND,wayland"
          "GDK_SCALE,1"
          "CLUTTER_BACKEND,wayland"
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "QT_AUTO_SCREEN_SCALE_FACTOR,1"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
          "QT_QPA_PLATFORM,wayland;xcb"
          "QT_SCALE_FACTOR,1"
          "QT_ENABLE_HIGHDPI_SCALING,0"
          "_JAVA_AWT_WM_NONREPARENTING,1"
        ];
        exec-once =
          [
            "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
            "$wallpaper -q"
            #"dbus-launch --exit-with-session waybar"
            "$bar"
            "hypridle"
            "poweralertd"
            "nm-applet"
            "wl-clip-persist --clipboard regular"
          ]
          ++ (
            if (osConfig.myOptions.defaultApps.terminal.command == "footclient")
            then ["foot --server"]
            else []
          );
        monitor =
          if (osConfig.networking.hostName == "fluoride")
          then ["DP-2,2560x1440@59.95100,0x0,1" ",preferred,auto,1"]
          else [",preferred,auto,1"];
        input = {
          kb_layout = "us";
          follow_mouse = 1;
          scroll_points = "flat";
          kb_model = lib.mkIf (osConfig.networking.hostName == "cyberia") "thinkpad";
          touchpad = {
            disable_while_typing = false;
            scroll_factor = osConfig.myOptions.hardwareFeatures.laptop.touchpadScrollFactor;
          };
        };
        device = [
          {
            name = "tpps/2-ibm-trackpoint";
            accel_profile = "flat";
            sensitivity = 0.5;
          }
          /*
            {
            name = "etps/2-elantech-touchpad";
            sensitivity = 0.3;
            accel_profile = "flat";
          }
          */
        ];
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          disable_hyprland_qtutils_check = true;
          vfr = true;
          vrr = true;
          enable_swallow = true;
          swallow_regex = "(foot|kitty|allacritty|Alacritty)";
          force_default_wallpaper = 0;
          font_family = config.stylix.fonts.sansSerif.name;
        };
        gestures = {
          workspace_swipe = 1;
          workspace_swipe_fingers = 3;
          workspace_swipe_forever = true;
          workspace_swipe_direction_lock = false;
        };
        general = {
          gaps_in = 5;
          gaps_out = 15;
          border_size = 1;
          layout = "dwindle";
          allow_tearing = false;
          "col.inactive_border" = "rgb(${config.stylix.base16Scheme.base01})";
          "col.active_border" = "rgb(${config.stylix.base16Scheme.base01})";
          #"col.active_border" = builtins.trace "set accent color in hyprland config" "rgb(${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}})";
        };
        decoration = {
          rounding = 10;
          blur.enabled = false;
          shadow = {
            enabled = true;
            ignore_window = true;
            range = 20;
            offset = "0 2";
            render_power = 4;
            color = "rgba(00000030)";
          };
        };
        plugin = {
          # overview = {
          #   panelColor = "rgb(${config.stylix.base16Scheme.base00})";
          #   workspaceInactiveBackground = "rgb(${config.stylix.base16Scheme.base01})";
          #   workspaceActiveBackground = "rgb(${config.stylix.base16Scheme.base07})";
          #   workspaceInactiveBorder = "rgb(${config.stylix.base16Scheme.base00})";
          #   workspaceActiveBorder = "rgb(${config.stylix.base16Scheme.base00})";
          #   centerAligned = true;
          #   autoDrag = true;
          #   autoScroll = true;
          #   #overrideGaps = false;
          # };
          hyprbars = {
            bar_color = "rgb(${config.stylix.base16Scheme.base00})";
            bar_height =
              if smallBars
              then 36
              else 42;
            bar_text_font = "${config.stylix.fonts.sansSerif.name} Bold";
            bar_text_size = config.stylix.fonts.sizes.applications;
            bar_text_align = "center";
            bar_precedence_over_border = true;
            bar_padding = 15;
            bar_button_padding = 12;
            disable_initialization_message = true;
            "col.text" = "rgb(${config.stylix.base16Scheme.base03})";
            bar_buttons_alignment = "left";
            bar_part_of_window = true;
            hyprbars-button = [
              "rgb(${closeButtonColor}), 15, , hyprctl dispatch killactive"
              "rgb(${config.stylix.base16Scheme.base0A}), 15, , hyprctl dispatch movetoworkspacesilent special"
              "rgb(${config.stylix.base16Scheme.base0B}), 15, , hyprctl dispatch fullscreen 1"
            ];
          };
          /*
            dynamic-cursors = {
            enabled = true;
            mode = "stretch";
            threshold = 2;
            stretch = {
              limit = 1500;
              function = "quadratic";
            };
          };
          */
          /*
            borders-plus-plus = {
            add_borders = 1;
            "col.border_1" = "rgb(242120)";
            border_size_1 = 10;
            natural_rounding = "yes";
          };
          */
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        /*
        master = {
        new_status = "slave";
        };
        */
        bind = [
          "$mainMod, Return, exec, $terminal"
          "$mainMod, W, exec, $browser"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, P, exec, $menu"
          "$mainMod, n, exec, $terminal -e ncmpcpp"
          "$mainMod SHIFT, O, exec, rofi -show window"
          "$mainMod, S, exec, $screenshot"
          "$mainMod SHIFT, Q, exec, $power"
          "$mainMod CTRL, L, exec, $lock"
          "$mainMod, C, exec, $colorPicker"
          "$mainMod, R, exec, $screenRecorder"
          "$mainMod SHIFT, B, exec, $bar"
          "$mainMod SHIFT, W, exec, $wallpaper"
          "$mainMod SHIFT, F, exec, ${../scripts/restart-foot-server.sh}"
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, E, exit,"
          "$mainMod, F, togglefloating,"

          # "$mainMod, Tab, overview:toggle,"
          "$mainMod SHIFT, P, pseudo,"

          #"$mainMod, left, scroller:movefocus, l"
          #"$mainMod, right, scroller:movefocus, r"
          #"$mainMod, down, scroller:movefocus, d"
          #"$mainMod, up, scroller:movefocus, u"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, down, movefocus, d"
          "$mainMod, up, movefocus, u"

          #"$mainMod, C, scroller:alignwindow, c"
          "$mainMod, C, centerwindow,"

          #"$mainMod, R, scroller:cyclesize, +1"
          #"$mainMod, equal, scroller:cyclesize, +1"
          #"$mainMod, minus, scroller:cyclesize, -1"
          #"$mainMod, H, scroller:setmode, r"
          #"$mainMod, V, scroller:setmode, c"

          #"$mainMod SHIFT, left, scroller:movewindow, l"
          #"$mainMod SHIFT, right, scroller:movewindow, r"
          #"$mainMod SHIFT, down, scroller:movewindow, d"
          #"$mainMod SHIFT, up, scroller:movewindow, u"
          "$mainMod SHIFT, left, movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, down, movewindow, d"
          "$mainMod SHIFT, up, movewindow, u"

          "$mainMod CTRL, left, resizeactive, -l0 0"
          "$mainMod CTRL, right, resizeactive, 10 0"
          "$mainMod CTRL, down, resizeactive, 0 10"
          "$mainMod CTRL, up, resizeactive, 0 -10"

          #"$mainMod, bracketleft, scroller:admitwindow,"
          #"$mainMod, bracketright, scroller:expelwindow,"
          #"$mainMod, M, scroller:fitsize, active"
          #"$mainMod, O, scroller:toggleoverview,"
          #"$mainMod, tab, scroller:toggleoverview,"

          "$mainMod, X, pin,"

          #"$mainMod SHIFT, Return, layoutmsg, swapwithmaster"
          #"$mainMod, I, layoutmsg, addmaster"
          #"$mainMod, D, layoutmsg, removemaster"
          "$mainMod, M, fullscreen, 1"
          "$mainMod SHIFT, M, fullscreen, 0"
          #"$mainMod SHIFT, comma, movewindow, l"
          #"$mainMod SHIFT, period, movewindow, r"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
          #"$mainMod Ctrl, Right, workspace, +1"
          #"$mainMod Ctrl, Left, workspace, -1"
          "$mainMod SHIFT, S, togglespecialworkspace,"
          "$mainMod Ctrl, Up, movetoworkspacesilent, special"

          "$mainMod, mouse_down, workspace, e-1"
          "$mainMod, mouse_up, workspace, e+1"

          ", XF86AudioMute, exec, pamixer -t"
          ", XF86AudioMicMute, exec, pamixer --default-source -t"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"

          ", XF86Lock, exec, $lock"
          ", code:107, exec, $screenshot"
        ];
        binde = [
          ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          "$mainMod, Minus, splitratio, -0.1"
          "$mainMod, Equal, splitratio, 0.1"
        ];
        bindl = [
          ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        windowrulev2 = [
          "plugin:hyprbars:title_color rgb(${config.stylix.base16Scheme.base05}), focus:1"
          "suppressevent maximize, class:.*"
          "nomaxsize, title:^(Wine configuration)$"
          "float, class:^(org.kde.kruler)$"
          "float, title:^(HyprViewBinds)$"
          "float, title:^(galculator)$"
          "float, title:^(Open File)(.*)$"
          "float, title:^(Select a File)(.*)$"
          "float, title:^(Open Folder)(.*)$"
          "float, title:^(Save As)(.*)$"
          "fullscreen, title:^((E|e)tterna)(.*)$"
          # "size 640 360, title:(Picture-in-Picture)"
          "pin, title:^(Picture-in-Picture)$"
          "float, title:^(Picture-in-Picture)$"
          "float, title:^(Authentication Required)$"
          "float, title:^(Soundboard)$"
          "plugin:hyprbars:nobar, class:^(org.kde.kruler)"
          "plugin:hyprbars:nobar, title:^(vesktop)$"
          "plugin:hyprbars:nobar, title:^(File Upload)$"
          "plugin:hyprbars:nobar, title:^(Empty Trash)$"
          "plugin:hyprbars:nobar, title:^(File Manager Preferences)$"
          "plugin:hyprbars:nobar, title:^(Choose a color)$"
          "plugin:hyprbars:nobar, title:^(Open File)$"
          "plugin:hyprbars:nobar, title:^(Thunar Preferences)$"
        ];
        animations = {
          enabled = true;
          bezier = [
            "wind, 0.05, 0.9, 0.1, 1.05"
            "winIn, 0.1, 1.1, 0.1, 1.1"
            "winOut, 0.3, -0.3, 0, 1"
            "liner, 1, 1, 1, 1"
          ];
          animation = [
            "windows, 1, 6, wind, slide"
            "windowsIn, 1, 6, winIn, slide"
            "windowsOut, 1, 5, winOut, slide"
            "windowsMove, 1, 5, wind, slide"
            "border, 1, 1, liner"
            "borderangle, 1, 30, liner, once"
            "fade, 1, 10, default"
            "workspaces, 1, 5, wind"
          ];
        };
      };
    };
  };
}
