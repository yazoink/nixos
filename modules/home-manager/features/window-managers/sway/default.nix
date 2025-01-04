{config, lib, pkgs, osConfig, ...}:
{
  imports = [./swayidle.nix];
  config = lib.mkIf osConfig.bundles.desktopBase.sway.enable {
    bundles.desktopBase = {
      swaync.enable = true;
      rofi.enable = true;
      screenshot.enable = true;
      simpleLogout.enable = true;
      waybar.enable = true;
    };

    home.packages = with pkgs; [
      swaybg
      wl-clipboard
      wl-clip-persist
      upower # for poweralertd
      kdePackages.qtwayland
      networkmanagerapplet
      wdisplays
      poweralertd
      grim
      slurp
      hyprpicker
      autotiling
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = 1;
      MOZ_ENABLE_WAYLAND = 1;
      GDK_BACKEND = "wayland";
      CLUTTER_BACKEND = "wayland";
      GDK_SCALE = 1;
      XDG_SESSION_TYPE = "wayland";
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      QT_QPA_PLATFORM = "wayland";
      QT_SCALE_FACTOR = 1;
      XCURSOR_SIZE = config.stylix.cursor.size;
    };
    
    stylix.targets.sway.enable = false;

    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      xwayland = true;
      checkConfig = false;
      extraConfig = ''
        focus_follows_mouse yes
        title_align center
        titlebar_padding 10
        corner_radius 10
        #smart_corner_radius on
        default_border normal 0
        blur disable
        shadows enable
        shadow_blur_radius 15
        shadow_color #000000AA
        #default_dim_inactive 0.15
        titlebar_separator disable
        layer_effects "waybar" shadows enable;
        #layer_effects "rofi" shadows enable;
        #layer_effects "gtk-layer-shell" shadows enable;
        #layer_effects "notifications" shadows enable;
        layer_effects "swaync-control-center" shadows enable;
        layer_effects "swaync-notification-window" shadows enable;

        for_window [class="Firefox"] inhibit_idle fullscreen
        for_window [app_id="firefox"] inhibit_idle fullscreen

        input type:touchpad {
          dwt disabled
          tap enabled
        }

        bindgesture swipe:right workspace next
        bindgesture swipe:left workspace prev

        for_window [title="^File Upload.*"] floating enable
        for_window [title="^Open File.*"] floating enable
        for_window [title="^Open Folder.*"] floating enable
        for_window [title="^Save As.*"] floating enable
        for_window [title="^Select a File.*"] floating enable
        for_window [title="^Picture-in-Picture$"] floating enable, sticky enable
        for_window [title="^galculator$"] floating enable
        for_window [title="^Empty Trash$"] floating enable
        for_window [title="^File Manager Preferences$"] floating enable
        for_window [class="^org.kde.kruler$"] floating enable
        for_window [instance="Browser" window_role="About"] floating enable
        for_window [title = "About Mozilla Firefox"] floating enable
        for_window [window_role = "About"] floating enable

        seat * xcursor_theme ${config.stylix.cursor.name} ${builtins.toString config.stylix.cursor.size}
      '';
      config = rec {
        modifier = "Mod4";
        floating.modifier = modifier;
        terminal = osConfig.myOptions.defaultApps.terminal.command;
        menu = "exec rofi -show drun";
        defaultWorkspace = "workspace number 1";
        startup = [
          {command = "exec ${lib.getExe pkgs.swaybg} -i ${osConfig.myOptions.desktopTheme.wallpaper} -m fill";}
          {command = "exec ${../scripts/waybar.sh}";}
          {command = "exec mpDris2 --music-dir=~/mu &";}
          {command = "exec ${lib.getExe pkgs.poweralertd}";}
          {command = "exec nm-applet";}
          {command = "exec autotiling";}
        ];
        gaps = {
          inner = 10;
          outer = 10;
          smartBorders = "off";
          smartGaps = false;
        };
        bars = [];
        fonts = {
          names = [config.stylix.fonts.sansSerif.name "Font Awesome 6 Free"];
          style = "Bold";
          size  = "${builtins.toString config.stylix.fonts.sizes.desktop}";
        };
        colors = {
          background = "#${config.stylix.base16Scheme.base00}";
          focused = {
            #childBorder = "#${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}";
            border = "#${config.stylix.base16Scheme.base00}";
            background = "#${config.stylix.base16Scheme.base00}";
            text = "#${config.stylix.base16Scheme.base05}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base00}";
          };
          focusedInactive = {
            #border = "#${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}";
            border = "#${config.stylix.base16Scheme.base00}";
            background = "#${config.stylix.base16Scheme.base00}";
            text = "#${config.stylix.base16Scheme.base03}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base00}";
          };
          unfocused = {
            border = "#${config.stylix.base16Scheme.base00}";
            background = "#${config.stylix.base16Scheme.base00}";
            text = "#${config.stylix.base16Scheme.base03}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base00}";
          };
          urgent = {
            #border = "#${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}";
            border = "#${config.stylix.base16Scheme.base00}";
            background = "#${config.stylix.base16Scheme.base00}";
            text = "#${config.stylix.base16Scheme.base05}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base00}";
          };
          placeholder = {
            border = "#${config.stylix.base16Scheme.base01}";
            background = "#${config.stylix.base16Scheme.base00}";
            text = "#${config.stylix.base16Scheme.base04}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base00}";
          };
        };
        keybindings = {
          "${modifier}+Return" = "exec ${pkgs.foot}/bin/footclient";
          "${modifier}+q" = "kill";
          "${modifier}+p" = "${menu}";
          "${modifier}+Shift+w" = "exec rofi -show window";
          "${modifier}+Shift+r" = "restart";
          "${modifier}+f" = "floating toggle";
          "${modifier}+m" = "fullscreen";
          "${modifier}+x" = "sticky toggle";
          "${modifier}+r" = "mode \"resize\"";
          "${modifier}+space" = "focus mode_toggle";
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Right" = "move right";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Left" = "focus left";
          "${modifier}+Right" = "focus right";
          "${modifier}+Up" = "focus up";
          "${modifier}+Down" = "focus down";
          "${modifier}+h" = "splith";
          "${modifier}+v" = "splitv";
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 10";
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";
          "${modifier}+Shift+0" = "move container to workspace number 10";
          "${modifier}+Control+up" = "move scratchpad";
          "${modifier}+Shift+s" = "scratchpad show";
          "${modifier}+w" = "exec ${osConfig.myOptions.defaultApps.webBrowser.command}";
          "${modifier}+e" = "exec ${osConfig.myOptions.defaultApps.fileManager.command}";
          "${modifier}+s" = "exec ${config.bundles.desktopBase.screenshot.package}/bin/screenshot -s";
          "${modifier}+c" = "exec ${../scripts/color.sh}";
          "${modifier}+Shift+b" = "exec ${../scripts/waybar.sh}";
          "${modifier}+Shift+q" = "exec simple-logout";
          "${modifier}+Control+l" = "exec ${lib.getExe pkgs.gtklock}";
          #"${modifier}+r" = "exec ${lib.getExe pkgs.kooha}";
          "XF86MonBrightnessDown" = "exec ${lib.getExe pkgs.light} -U 10";
          "XF86MonBrightnessUp" = "exec ${lib.getExe pkgs.light} -A 10";
          "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'";
          "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'";
          "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
        };
      };
    };
  };
}
