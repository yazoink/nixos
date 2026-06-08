# todo: menu, media keybinds, eww keybinds, better waybar workspace widget(?), window button svgs(?)
{
  osConfig,
  config,
  pkgs,
  ...
}: let
  inherit (config.stylix) base16Scheme fonts;
  inherit (osConfig.myOptions) defaultApps desktopTheme;
  wallpaperCommand =
    if (desktopTheme.wallpaper.type == "color")
    then "${../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.color.hex}"
    else
      (
        if (osConfig.myOptions.desktopTheme.wallpaper.image.fillType == "fill")
        then "${../scripts/swaybg.sh} -i ${desktopTheme.wallpaper.image.path}"
        else "${../scripts/swaybg.sh} -t ${desktopTheme.wallpaper.image.path}"
      );
in {
  home.packages = with pkgs; [
    wl-clipboard
    wf-recorder
    wayland-pipewire-idle-inhibit
    wl-clip-persist
    networkmanagerapplet
    brightnessctl
    poweralertd
    grim
    slurp
    hyprpicker
    wdisplays
    swaybg
    libnotify
  ];
  home.file.".config/labwc/themerc-override".text = ''
    # This file contains all themerc options with default values
    #
    # System-wide and local themes can be overridden by creating a copy of this
    # file and renaming it to $HOME/.config/labwc/themerc-override. Be careful
    # though - if you only want to override a small number of specific options,
    # make sure all other lines are commented out or deleted.

    # general
    border.width: 1

    #
    # The global padding.{width,height} of openbox are not supported because
    # the default labwc button geometry deviates from that of openbox
    #
    window.titlebar.padding.width: 10
    window.titlebar.padding.height: 8

    # window border
    window.active.border.color: #${base16Scheme.base01}
    window.inactive.border.color: #${base16Scheme.base01}

    # ToggleKeybinds status indicator
    window.active.indicator.toggled-keybind.color: #${base16Scheme.base08}

    # window titlebar background
    window.active.title.bg.color: #${base16Scheme.base00}
    window.inactive.title.bg.color: #${base16Scheme.base00}
    window.*.title.bg: Solid

    # Vertical and SplitVertical gradients are supported for window.*.title.bg
    # with the following additional color fields. See labwc-theme(5) for examples.
    #
    #     window.*.title.bg.colorTo:
    #     window.*.title.bg.color.splitTo:
    #     window.*.title.bg.colorTo.splitTo:

    # window titlebar text
    window.active.label.text.color: #${base16Scheme.base05}
    window.inactive.label.text.color: #${base16Scheme.base04}
    window.label.text.justify: Center

    # window button width and spacing
    window.button.width: 20
    window.button.height: 20
    window.button.spacing: 5

    # window button hover overlay
    window.button.hover: #00000000

    # window buttons
    window.active.button.unpressed.image.color: #${base16Scheme.base05}
    window.inactive.button.unpressed.image.color: #${base16Scheme.base03}
    window.active.button.disabled.image.color: #${base16Scheme.base04}
    window.inactive.button.disabled.image.color: #${base16Scheme.base04}

    window.active.button.iconify.unpressed.image.color: #${base16Scheme.base0A}
    window.active.button.max.unpressed.image.color: #${base16Scheme.base0B}
    window.active.button.close.unpressed.image.color: #${base16Scheme.base08}
    window.active.button.shade.unpressed.image.color: #${base16Scheme.base0D}
    window.active.button.desk.unpressed.image.color: #${base16Scheme.base05}

    window.active.button.iconify.pressed.image.color: #${base16Scheme.base0A}
    window.active.button.max.pressed.image.color: #${base16Scheme.base0B}
    window.active.button.close.pressed.image.color: #${base16Scheme.base08}
    window.active.button.shade.pressed.image.color: #${base16Scheme.base0D}
    window.active.button.desk.pressed.image.color: #${base16Scheme.base05}

    # window drop-shadows
    window.active.shadow.size: 60
    window.inactive.shadow.size: 40
    window.active.shadow.color: #00000060
    window.inactive.shadow.color: #00000040

    # Note that "menu", "iconify", "max", "close" buttons colors can be defined
    # individually by inserting the type after the button node, for example:
    #
    #     window.active.button.iconify.unpressed.image.color: #333333

    # menu
    menu.overlap.x: 0
    menu.overlap.y: 0
    menu.width.min: 20
    menu.width.max: 200
    menu.border.width: 1
    menu.border.color: #${base16Scheme.base02}
    menu.items.bg.color: #${base16Scheme.base00}
    menu.items.text.color: #${base16Scheme.base05}
    menu.items.active.bg.color: #${base16Scheme.base01}
    menu.items.active.text.color: #${base16Scheme.base05}
    menu.items.padding.x: 10
    menu.items.padding.y: 5
    menu.separator.width: 1
    menu.separator.padding.width: 5
    menu.separator.padding.height: 0
    menu.separator.color: #${base16Scheme.base02}
    menu.title.bg.color: #${base16Scheme.base01}
    menu.title.text.color: #${base16Scheme.base05}
    menu.title.text.justify: Center

    # on screen display (window-cycle dialog)
    osd.bg.color: #${base16Scheme.base00}
    osd.border.color: #${base16Scheme.base02}
    osd.border.width: 1
    osd.label.text.color: #${base16Scheme.base05}

    # width can be set as percent (of screen width)
    # example 50% or 75% instead of 600, max 100%
    osd.window-switcher.style-classic.width: 600

    osd.window-switcher.style-classic.padding: 5
    osd.window-switcher.style-classic.item.padding.x: 10
    osd.window-switcher.style-classic.item.padding.y: 1
    osd.window-switcher.style-classic.item.active.border.width: 0
    osd.window-switcher.style-classic.item.active.border.color: #706f6d
    osd.window-switcher.style-classic.item.active.bg.color: #${base16Scheme.base01}
    # The icon size the same as the font size by default
    # osd.window-switcher.style-classic.item.icon.size: 50

    osd.window-switcher.style-thumbnail.width.max: 80%
    osd.window-switcher.style-thumbnail.padding: 4
    osd.window-switcher.style-thumbnail.item.width: 300
    osd.window-switcher.style-thumbnail.item.height: 250
    osd.window-switcher.style-thumbnail.item.padding: 10
    osd.window-switcher.style-thumbnail.item.active.border.width: 0
    osd.window-switcher.style-thumbnail.item.active.border.color: #706f6d
    osd.window-switcher.style-thumbnail.item.active.bg.color: #${base16Scheme.base01}
    osd.window-switcher.style-thumbnail.item.icon.size: 60

    osd.window-switcher.preview.border.width: 1
    osd.window-switcher.preview.border.color: #${base16Scheme.${osConfig.desktopTheme.base16Accent}}

    osd.workspace-switcher.boxes.width: 20
    osd.workspace-switcher.boxes.height: 20
    osd.workspace-switcher.boxes.border.width: 1

    # Default values for following options change depending on the rendering
    # backend. For software-based renderers, *.bg.enabled is "no" and
    # *.border.enabled is "yes" if not set. For hardware-based renderers,
    # *.bg.enabled is "yes" and *.border.enabled is "no" if not set.
    # Setting *.bg.enabled to "yes" for software-based renderer with translucent
    # background color may severely impact performance.
    #
    # snapping.overlay.region.bg.enabled:
    # snapping.overlay.edge.bg.enabled:
    # snapping.overlay.region.border.enabled:
    # snapping.overlay.edge.border.enabled:

    snapping.overlay.region.bg.color: #${base16Scheme.${osConfig.desktopTheme.base16Accent}}80
    snapping.overlay.edge.bg.color: #${base16Scheme.${osConfig.desktopTheme.base16Accent}}80
    snapping.overlay.region.border.width: 1
    snapping.overlay.edge.border.width: 1
    snapping.overlay.region.border.color: #${base16Scheme.${osConfig.desktopTheme.base16Accent}}
    snapping.overlay.edge.border.color: #${base16Scheme.${osConfig.desktopTheme.base16Accent}}
  '';
  home.file.".themes/my-labwc/labwc".source = ./icons;
  wayland.windowManager.labwc = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    environment = [
      "XDG_CURRENT_DESKTOP=labwc:wlroots"
      "XKB_DEFAULT_LAYOUT=us"
      "NIXOS_OZONE_WL=1"
      "MOZ_ENABLE_WAYLAND=1"
      "GDK_BACKEND=wayland"
      "GDK_SCALE=1"
      "CLUTTER_BACKEND=wayland"
      "XDG_SESSION_TYPE=wayland"
      "QT_AUTO_SCREEN_SCALE_FACTOR=1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
      "QT_QPA_PLATFORM=wayland;xcb"
      "QT_SCALE_FACTOR=1"
      "QT_ENABLE_HIGHDPI_SCALING=0"
      "_JAVA_AWT_WM_NONREPARENTING=1"
      "ELECTRON_OZONE_PLATFORM_HINT=wayland"
      "EWW_CONFIG_DIR=/home/${osConfig.myOptions.userAccount.username}/.config/widgets"
    ];
    autostart =
      [
        "waybar &"
        "${wallpaperCommand} -q &"
        "walker --gapplication-service &"
        "poweralertd &"
        "nm-applet &"
        "wl-clip-persist --clipboard regular &"
        "wayland-pipewire-idle-inhibit &"
        "swayidle &"
      ]
      ++ (
        if (defaultApps.terminal.command == "footclient")
        then ["foot --server"]
        else []
      );
    rc = {
      desktops = {
        "@number" = 5;
      };
      theme = {
        # name = "${config.gtk.theme.name}";
        name = "my-labwc";
        cornerRadius = 10;
        font = {
          "@name" = "${fonts.sansSerif.name}";
          "@size" = "${builtins.toString fonts.sizes.desktop}";
          "@weight" = "bold";
        };
        icon = "${osConfig.desktopTheme.icons.name}";
        titlebar = {
          showTitle = true;
          # layout = "icon:iconify,max,close";
          layout = "iconify,max,close:";
          dropShadows = "yes";
          dropShadowsOnTiled = "yes";
        };
      };
      focus = {
        followMouse = "yes";
        raiseOnFocus = "no";
      };
      windowSwitcher = {
        osd = {
          "@style" = "thumbnail";
        };
      };
      keyboard = {
        default = true;
        keybind = [
          # reconfigure
          {
            "@key" = "W-S-r";
            action = {
              "@name" = "Reconfigure";
            };
          }
          # close window
          {
            "@key" = "A-F4";
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
          {
            "@key" = "W-q";
            action = {
              "@name" = "Close";
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
            "@key" = "W-S-Left";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "left";
              "@wrap" = "yes";
              "@toggle" = "no";
            };
          }
          {
            "@key" = "W-S-Right";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "right";
              "@wrap" = "yes";
              "@toggle" = "no";
            };
          }
          # show desktop
          {
            "@key" = "W-S-d";
            action = {
              "@name" = "ShowDesktop";
            };
          }
          # terminal
          {
            "@key" = "W-Return";
            action = {
              "@name" = "Execute";
              "@command" = "${defaultApps.terminal.command}";
            };
          }
          # launcher
          {
            "@key" = "W-p";
            action = {
              "@name" = "Execute";
              "@command" = "pkill walker || walker";
            };
          }
          {
            "@key" = "W-r";
            action = {
              "@name" = "Execute";
              "@command" = "pkill walker || walker";
            };
          }
          # selective screenshot
          {
            "@key" = "W-s";
            action = {
              "@name" = "Execute";
              "@command" = "bash ${../scripts/screenshot} -s";
            };
          }
          # fullscreen screenshot
          {
            "@key" = "W-S-s";
            action = {
              "@name" = "Execute";
              "@command" = "bash ${../scripts/screenshot}";
            };
          }
          # lock screen
          {
            "@key" = "W-C-l";
            action = {
              "@name" = "Execute";
              "@command" = "hyprlock";
            };
          }
          # pick colour
          {
            "@key" = "W-c";
            action = {
              "@name" = "Execute";
              "@command" = "${../scripts/color.sh}";
            };
          }
          # launch browser
          {
            "@key" = "W-w";
            action = {
              "@name" = "Execute";
              "@command" = "${defaultApps.webBrowser.command}";
            };
          }
          # launch file manager
          {
            "@key" = "W-e";
            action = {
              "@name" = "Execute";
              "@command" = "${defaultApps.fileManager.command}";
            };
          }
          # restart waybar
          {
            "@key" = "W-S-b";
            action = {
              "@name" = "Execute";
              "@command" = "${../scripts/waybar.sh}";
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
          # restart foot server
          {
            "@key" = "W-S-f";
            action = {
              "@name" = "Execute";
              "@command" = "${../scripts/restart-foot-server.sh}";
            };
          }
          # close eww windows and launcher
          {
            "@key" = "Esc";
            action = {
              "@name" = "Execute";
              "@command" = "eww --config /home/${osConfig.myOptions.userAccount.username}/.config/widgets close-all; pkill walker";
            };
          }
          # media keys
          {
            "@key" = "XF86AudioPlay";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl play-pause";
            };
          }
          {
            "@key" = "XF86AudioPause";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl play-pause";
            };
          }
          {
            "@key" = "XF86AudioNext";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl next";
            };
          }
          {
            "@key" = "XF86AudioPrev";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl previous";
            };
          }
          {
            "@key" = "XF86AudioMute";
            action = {
              "@name" = "Execute";
              "@command" = "swayosd-client --output-volume mute-toggle";
            };
          }
          {
            "@key" = "XF86AudioMicMute";
            action = {
              "@name" = "Execute";
              "@command" = "swayosd-client --input-volume mute-toggle";
            };
          }
          {
            "@key" = "XF86AudioRaiseVolume";
            action = {
              "@name" = "Execute";
              "@command" = "swayosd-client --output-volume raise";
            };
          }
          {
            "@key" = "XF86AudioLowerVolume";
            action = {
              "@name" = "Execute";
              "@command" = "swayosd-client --output-volume lower";
            };
          }
          {
            "@key" = "XF86MonBrightnessDown";
            action = {
              "@name" = "Execute";
              "@command" = "swayosd-client --brightness lower";
            };
          }
          {
            "@key" = "XF86MonBrightnessUp";
            action = {
              "@name" = "Execute";
              "@command" = "swayosd-client --brightness raise";
            };
          }
        ];
      };
    };
  };
}
