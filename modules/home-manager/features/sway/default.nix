{config, lib, pkgs, osConfig, ...}:
{
  config = lib.mkIf osConfig.myOptions.bundles.desktopBase.enable {
    bundles.desktopBase = {
      mako.enable = true;
      rofi.enable = true;
      screenshot.enable = true;
      simpleLogout.enable = true;
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
    
    stylix.targets.sway.enable = false;

    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      checkConfig = false;
      package = pkgs.swayfx;
      xwayland = true;
      extraConfig = ''
        title_align center
        titlebar_padding 6
        corner_radius 10
        smart_corner_radius on
        default_border normal 4
      '';
      config = rec {
        modifier = "Mod4";
        floating.modifier = modifier;
        terminal = osConfig.myOptions.defaultApps.terminal.command;
        menu = "exec rofi -show drun";
        startup = [
          {command = "exec ${lib.getExe pkgs.swaybg} -i ${osConfig.myOptions.desktopTheme.wallpaper}";}
          {command = "exec ${lib.getExe pkgs.swaybg} -i ${osConfig.myOptions.desktopTheme.wallpaper}";}
          {command = "exec ${./scripts/waybar.sh}";}
        ];
        gaps = {
          inner = 5;
          outer = 5;
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
            border = "#${config.stylix.base16Scheme.base01}";
            background = "#${config.stylix.base16Scheme.base01}";
            text = "#${config.stylix.base16Scheme.base05}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base01}";
          };
          focusedInactive = {
            #border = "#${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}";
            border = "#${config.stylix.base16Scheme.base01}";
            background = "#${config.stylix.base16Scheme.base01}";
            text = "#${config.stylix.base16Scheme.base04}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base01}";
          };
          unfocused = {
            border = "#${config.stylix.base16Scheme.base00}";
            background = "#${config.stylix.base16Scheme.base00}";
            text = "#${config.stylix.base16Scheme.base04}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base00}";
          };
          urgent = {
            #border = "#${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}}";
            border = "#${config.stylix.base16Scheme.base01}";
            background = "#${config.stylix.base16Scheme.base01}";
            text = "#${config.stylix.base16Scheme.base05}";
            indicator = "#${config.stylix.base16Scheme.base00}";
            childBorder = "#${config.stylix.base16Scheme.base01}";
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
          "${modifier}+s" = "exec ${./scripts/screenshot.sh}";
          "${modifier}+c" = "exec ${./scripts/color.sh}";
          "${modifier}+b" = "exec ${./scripts/waybar.sh}";
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
