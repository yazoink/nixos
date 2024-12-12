{pkgs, lib, config, osConfig, inputs,  ...}:
{
  imports = [
    ./hypridle.nix
  ];

  config = lib.mkIf osConfig.bundles.desktopBase.hyprland.enable {
    home = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
        GDK_BACKEND = "wayland";
        #SDL_VIDEO_DRIVER = "wayland"; breaks steam
        CLUTTER_BACKEND = "wayland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_QPA_PLATFORM = "wayland";
      };
      file.".config/hyprland/scripts".source = ./scripts;
    };

    wayland.windowManager.hyprland = builtins.trace "hyprland config module enabled" {
      enable = true;
      #package = pkgs.hyprland;
      xwayland.enable = true;
      systemd.enable = true;
      #plugins = with pkgs.hyprlandPlugins; [hyprscroller];
      plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
        pkgs.hyprlandPlugins.hyprspace 
        #pkgs.hyprlandPlugins.hypr-dynamic-cursors
        pkgs.hyprlandPlugins.hyprbars
        #hyprbars # broken?
      ];
      settings = {
        "$terminal" = "foot";
        "$browser" = "firefox";
        "$fileManager" = "thunar";
        "$menu" = "rofi -show drun";
        "$screenshot" = "bash /home/${osConfig.myOptions.userAccount.username}/.config/hyprland/scripts/screenshot.sh";
        "$power" = "simple-logout";
        "$lock" = "gtklock";
        "$colorPicker" = "bash /home/${osConfig.myOptions.userAccount.username}/.config/hyprland/scripts/color.sh";
        "$screenRecorder" = "kooha";
        "$mainMod" = "SUPER";
        exec-once = [
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "mpDris2 --music-dir=~/mu &"
          #"dbus-launch --exit-with-session waybar"
          "waybar"
          "nm-applet"
          "hypridle"
          "poweralertd"
        ];
        monitor = if (osConfig.networking.hostName == "fluoride") then ["DP-2,2560x1440@59.95100,0x0,1.2" ",preferred,auto,1"] else [",preferred,auto,1"];
        input = {
          kb_layout = "us";
          follow_mouse = 1;
          scroll_points = "flat";
          kb_model = lib.mkIf (osConfig.networking.hostName == "cyberia") "thinkpad";
        };
        device = {
          name = "tpps/2-ibm-trackpoint";
          accel_profile = "flat";
          sensitivity = 0.5;
        };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          vfr = true;
          vrr = true;
          enable_swallow = true;
          swallow_regex = "(foot|kitty|allacritty|Alacritty)";
          force_default_wallpaper = 0;
        };
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          layout = "dwindle";
          allow_tearing = false;
          "col.inactive_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base02})";
          "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base0F})";
        };
        decoration = {
          rounding = 10;
          blur.enabled = false;
          shadow = {
            enabled = false;
            range = 20;
            render_power = 5;
          };
        };
        plugin = {
          overview = {
            panelColor = "rgb(${config.stylix.base16Scheme.base00})";
            workspaceInactiveBackground = "rgb(${config.stylix.base16Scheme.base01})";
            workspaceActiveBackground = "rgb(${config.stylix.base16Scheme.base07})";
            workspaceInactiveBorder = "rgb(${config.stylix.base16Scheme.base00})";
            workspaceActiveBorder = "rgb(${config.stylix.base16Scheme.base00})";
            centerAligned = true;
            #overrideGaps = false;
          };
          hyprbars = {
            bar_color = "rgb(${config.stylix.base16Scheme.base00})";
            bar_height = 36;
            bar_text_font = "${config.stylix.fonts.sansSerif.name} Bold";
            bar_text_size = config.stylix.fonts.sizes.applications;
            bar_text_align = "center";
            bar_part_of_window = true;
            bar_precedence_over_border = true;
            bar_padding = 15;
            bar_button_padding = 12;
            disable_initialization_message = true;
            "col.text" = "rgb(${config.stylix.base16Scheme.base05})";
            bar_buttons_alignment = "left";
            hyprbars-button = [
              "rgb(${config.stylix.base16Scheme.base0E}), 15, , hyprctl dispatch killactive"
              "rgb(${config.stylix.base16Scheme.base0A}), 15, , hyprctl dispatch movetoworkspacesilent special"
              "rgb(${config.stylix.base16Scheme.base0B}), 15, , hyprctl dispatch fullscreen 1"
            ];
          };
          /*dynamic-cursors = {
            enabled = true;
            mode = "stretch";
            threshold = 2;
            stretch = {
              limit = 1500;
              function = "quadratic";
            };
          };*/
          /*borders-plus-plus = {
            add_borders = 1;
            "col.border_1" = "rgb(242120)";
            border_size_1 = 10;
            natural_rounding = "yes";
          };*/
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        /*master = {
          new_status = "slave";
          };*/
        windowrulev2 = [
          "suppressevent maximize, class:.*"
        ];
        bind = [
          "$mainMod, Return, exec, $terminal"
          "$mainMod, W, exec, $browser"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, P, exec, $menu"
          "$mainMod SHIFT, W, exec, rofi -show window"
          "$mainMod, S, exec, $screenshot"
          "$mainMod SHIFT, Q, exec, $power"
          "$mainMod CTRL, L, exec, $lock"
          "$mainMod, C, exec, $colorPicker"
          "$mainMod, R, exec, $screenRecorder"
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, E, exit,"
          "$mainMod, F, togglefloating,"

          "$mainMod, Tab, overview:toggle,"
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
          
          "$mainMod CTRL, left, resizeactive, -l00 0"
          "$mainMod CTRL, right, resizeactive, 100 0"
          "$mainMod CTRL, down, resizeactive, 0 100"
          "$mainMod CTRL, up, resizeactive, 0 -100"

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
          "$mainMod Ctrl, Right, workspace, +1"
          "$mainMod Ctrl, Left, workspace, -1"
          "$mainMod SHIFT, S, togglespecialworkspace,"
          "$mainMod Ctrl, Up, movetoworkspacesilent, special"

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
      };
      extraConfig = ''
        animations {
          enabled = yes
          bezier = wind, 0.05, 0.9, 0.1, 1.05
          bezier = winIn, 0.1, 1.1, 0.1, 1.1
          bezier = winOut, 0.3, -0.3, 0, 1
          bezier = liner, 1, 1, 1, 1
          animation = windows, 1, 6, wind, slide
          animation = windowsIn, 1, 6, winIn, slide
          animation = windowsOut, 1, 5, winOut, slide
          animation = windowsMove, 1, 5, wind, slide
          animation = border, 1, 1, liner
          animation = borderangle, 1, 30, liner, loop
          animation = fade, 1, 10, default
          animation = workspaces, 1, 5, wind
        }
        
        windowrulev2 = nomaxsize, title:^(Wine configuration)$
        windowrulev2 = float, class:^(org.kde.kruler)$
        windowrulev2 = float, title:^(HyprViewBinds)$
        windowrulev2 = float, title:^(galculator)$
        windowrulev2 = fullscreen, title:^((E|e)tterna)(.*)$
        windowrulev2 = size 640 360, title:(Picture-in-Picture)
        windowrulev2 = pin, title:^(Picture-in-Picture)$
        windowrulev2 = float, title:^(Picture-in-Picture)$
        windowrulev2 = float, title:^(Authentication Required)$
        windowrulev2 = plugin:hyprbars:nobar, class:^(org.kde.kruler)
        windowrulev2 = plugin:hyprbars:nobar, title:^(vesktop)$
        windowrulev2 = plugin:hyprbars:nobar, title:^(File Upload)$
        windowrulev2 = plugin:hyprbars:nobar, title:^(Empty Trash)$
        windowrulev2 = plugin:hyprbars:nobar, title:^(File Manager Preferences)$
      '';
    };
  };
}
