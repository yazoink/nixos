{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: let
  barPadding =
    if osConfig.myOptions.desktopTheme.smallBars
    then 11
    else 14;
  wallpaperCommand =
    if osConfig.myOptions.desktopTheme.wallpaper.solidColor.enable
    then "${../scripts/swaybg.sh} -c ${osConfig.myOptions.desktopTheme.wallpaper.solidColor.hex}"
    else "${../scripts/swaybg.sh} -i ${osConfig.myOptions.desktopTheme.wallpaper.image}";
in {
  imports = [./hypridle.nix];
  config = lib.mkIf osConfig.bundles.desktopBase.sway.enable {
    bundles.desktopBase = {
      swaync.enable = true;
      #rofi.enable = true;
      anyrun.enable = true;
      screenshot.enable = true;
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
      QT_ENABLE_HIGHDPI_SCALING = 0;
      XCURSOR_SIZE = config.stylix.cursor.size;
      _JAVA_AWT_WM_NONREPARENTING = 1;
    };

    stylix.targets.sway.enable = false;

    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      xwayland = true;
      checkConfig = false;
      extraConfig =
        ''
          default_orientation vertical
          for_window [class=".*"] split toggle
          focus_follows_mouse yes
          title_align center
          titlebar_padding ${builtins.toString barPadding}
          titlebar_border_thickness 0
          corner_radius 15
          #smart_corner_radius on
          default_border normal 0
          default_floating_border normal 0
          blur disable
          shadows enable
          shadow_blur_radius 10
          shadow_color #000000AA
          #default_dim_inactive 0.15
          titlebar_separator disable
          layer_effects "waybar" shadows enable;
          #layer_effects "rofi" shadows enable;
          #layer_effects "gtk-layer-shell" shadows enable;
          #layer_effects "notifications" shadows enable;

          output * scale 1

          bindsym --whole-window {
            ${config.wayland.windowManager.sway.config.modifier}+button4 workspace prev
            ${config.wayland.windowManager.sway.config.modifier}+button5 workspace next
          }

          for_window [class="Firefox"] inhibit_idle fullscreen
          for_window [app_id="firefox"] inhibit_idle fullscreen

          input type:touchpad {
            dwt disabled
            tap enabled
          }

          bindgesture swipe:right workspace next
          bindgesture swipe:left workspace prev

          for_window {
            [title="^File Upload.*"] floating enable
            [title="^Open File.*"] floating enable
            [title="^Open Folder.*"] floating enable
            [title="^Save As.*"] floating enable
            [title="^Select a File.*"] floating enable
            [title="^Picture-in-Picture$"] floating enable, sticky enable
            [app_id="firefox" title="Picture-in-Picture"] floating enable, sticky enable
            [title="^galculator$"] floating enable
            [app_id="galculator"] floating enable
            [title="^Empty Trash$"] floating enable
            [title="^File Manager Preferences$"] floating enable
            [class="^org.kde.kruler$"] floating enable
            [instance="Browser" window_role="About"] floating enable
            [title = "About Mozilla Firefox"] floating enable
            [window_role = "About"] floating enable
            [window_role="pop-up"] floating enable
            [window_role="bubble"] floating enable
            [window_role="dialog"] floating enable
            [window_type="dialog"] floating enable
            [app_id="floating"] floating enable
            [title=".* is sharing your screen."] floating enable
            [app_id="firefox" title="Firefox — Sharing Indicator"] floating enable
            [app_id="zenity"] floating enable
            [app_id="^chrome-.*__.*$"] shortcuts_inhibitor disable
          }

          set $handle_dialog floating enable, move container to workspace current
          for_window {
              [app_id="soffice" title="Document Recovery$"] $handle_dialog
              [app_id="chromium" title="Open File"] $handle_dialog
              [app_id="firefox" title="^Enter name of file to save to…$"] $handle_dialog
              [app_id="firefox" title="^Open File$"] $handle_dialog
              [app_id="firefox" title="^Save As$"] $handle_dialog
              [app_id="firefox" title="^Save Image$"] $handle_dialog
              [app_id="firefox" title="File Upload"] $handle_dialog
              [app_id="firefox" title="^Firefox - Choose User Profile$"] $handle_dialog
              [app_id="firefox" title="^Developer Tools — "] $handle_dialog
              [app_id="firefox" title="^Opening "] $handle_dialog
              [app_id="firefox" title="^Extension: \(MetaMask\) - MetaMask Notification — Mozilla Firefox$"] $handle_dialog
              [app_id="Chromium" title="^DevTools - "] $handle_dialog
              [app_id="chromium-bin-browser" title="^Save File$"] $handle_dialog
              [app_id="telegram-desktop" title="^Choose Files$"] $handle_dialog
              [app_id="firefox" title="^Choose Application$"] $handle_dialog
              [title="(?:Open|Save) (?:File|Folder|As)"] $handle_dialog
              [app_id="pop-up,task_dialog,About"] $handle_dialog;
              [app_id="zenity"] $handle_dialog
              [window_role="pop-up,task_dialog,About"] $handle_dialog;
              [window_type="dialog"] $handle_dialog;
              [window_type="utility"] $handle_dialog;
              [window_type="toolbar"] $handle_dialog;
              [window_type="splash"] $handle_dialog;
              [window_type="menu"] $handle_dialog;
              [window_type="dropdown_menu"] $handle_dialog;
              [window_type="popup_menu"] $handle_dialog;
              [window_type="tooltip"] $handle_dialog;
              [window_type="notification"] $handle_dialog;
          }

          seat * xcursor_theme "${config.stylix.cursor.name}" ${builtins.toString config.stylix.cursor.size}
        ''
        + (
          if (osConfig.myOptions.defaultApps.terminal.command == "footclient")
          then "exec ${pkgs.foot}/bin/foot --server"
          else ""
        );
      config = rec {
        modifier = "Mod4";
        floating.modifier = modifier;
        terminal = osConfig.myOptions.defaultApps.terminal.command;
        menu = "exec pkill anyrun || anyrun";
        defaultWorkspace = "workspace number 1";
        startup = [
          {command = "${wallpaperCommand} -q";}
          {command = "${../scripts/waybar.sh}";}
          {command = "${lib.getExe pkgs.poweralertd}";}
          {command = "nm-applet";}
        ];
        gaps = {
          inner = 10;
          outer = 5;
          smartBorders = "off";
          smartGaps = false;
        };
        bars = [];
        fonts = {
          names = [config.stylix.fonts.sansSerif.name "Font Awesome 6 Free"];
          style = "Bold";
          size = "${builtins.toString config.stylix.fonts.sizes.desktop}";
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
          "${modifier}+q" = "split toggle, kill";
          "${modifier}+p" = "${menu}";
          "${modifier}+Shift+r" = "restart";
          "${modifier}+f" = "floating toggle";
          "${modifier}+m" = "fullscreen";
          "${modifier}+x" = "sticky toggle";
          "${modifier}+l" = "layout toggle split";
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
          "${modifier}+n" = "exec ${terminal} -e ${lib.getExe pkgs.ncmpcpp}";
          "${modifier}+Shift+b" = "exec ${../scripts/waybar.sh}";
          "${modifier}+Shift+f" = "exec ${../scripts/restart-foot-server.sh}";
          "${modifier}+Shift+w" = "exec ${wallpaperCommand}";
          "${modifier}+Shift+q" = "exec swaync-client -t -sw";
          "${modifier}+Control+l" = "exec ${lib.getExe pkgs.gtklock}";
          #"${modifier}+r" = "exec ${lib.getExe pkgs.kooha}";
          "XF86MonBrightnessDown" = "exec ${lib.getExe pkgs.light} -U 10";
          "XF86MonBrightnessUp" = "exec ${lib.getExe pkgs.light} -A 10";
          "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
          "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
          "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
        };
      };
    };
  };
}
