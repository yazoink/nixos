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
  ];
  home.file.".config/labwc/theme-override".text = ''
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
    window.titlebar.padding.width: 15
    window.titlebar.padding.height: 15

    # window border
    window.active.border.color: #${base16Scheme.base01}
    window.inactive.border.color: #${base16Scheme.base01}

    # ToggleKeybinds status indicator
    window.active.indicator.toggled-keybind.color: #${base16Scheme.base08}

    # window titlebar background
    window.active.title.bg.color: #${base16Scheme.base01}
    window.inactive.title.bg.color: #${base16Scheme.base01}
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
    window.label.text.justify: center

    # window button width and spacing
    window.button.width: 15
    window.button.height: 15
    window.button.spacing: 10

    # window button hover overlay
    window.button.hover.bg.color: #${base16Scheme.base05}20
    window.button.hover.bg.corner-radius: 15

    # window buttons
    window.active.button.unpressed.image.color: #${base16Scheme.base08}
    window.inactive.button.unpressed.image.color: #${base16Scheme.base03}

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
    menu.border.color: #${base16Scheme.base01}
    menu.items.bg.color: #${base16Scheme.base00}
    menu.items.text.color: #${base16Scheme.base05}
    menu.items.active.bg.color: #${base16Scheme.base01}
    menu.items.active.text.color: #${base16Scheme.base05}
    menu.items.padding.x: 10
    menu.items.padding.y: 5
    menu.separator.width: 1
    menu.separator.padding.width: 5
    menu.separator.padding.height: 5
    menu.separator.color: #${base16Scheme.base02}
    menu.title.bg.color: #${base16Scheme.base01}
    menu.title.text.color: #${base16Scheme.base05}
    menu.title.text.justify: Center

    # on screen display (window-cycle dialog)
    osd.bg.color: #e1dedb
    osd.border.color: #000000
    osd.border.width: 1
    osd.label.text.color: #000000

    # width can be set as percent (of screen width)
    # example 50% or 75% instead of 600, max 100%
    osd.window-switcher.style-classic.width: 600

    osd.window-switcher.style-classic.padding: 4
    osd.window-switcher.style-classic.item.padding.x: 10
    osd.window-switcher.style-classic.item.padding.y: 1
    osd.window-switcher.style-classic.item.active.border.width: 2
    osd.window-switcher.style-classic.item.active.border.color: #706f6d
    osd.window-switcher.style-classic.item.active.bg.color: #bfbcba
    # The icon size the same as the font size by default
    # osd.window-switcher.style-classic.item.icon.size: 50

    osd.window-switcher.style-thumbnail.width.max: 80%
    osd.window-switcher.style-thumbnail.padding: 4
    osd.window-switcher.style-thumbnail.item.width: 300
    osd.window-switcher.style-thumbnail.item.height: 250
    osd.window-switcher.style-thumbnail.item.padding: 10
    osd.window-switcher.style-thumbnail.item.active.border.width: 2
    osd.window-switcher.style-thumbnail.item.active.border.color: #706f6d
    osd.window-switcher.style-thumbnail.item.active.bg.color: #bfbcba
    osd.window-switcher.style-thumbnail.item.icon.size: 60

    osd.window-switcher.preview.border.width: 1
    osd.window-switcher.preview.border.color: #dddda6,#000000,#dddda6

    osd.workspace-switcher.boxes.width: 20
    osd.workspace-switcher.boxes.height: 20
    osd.workspace-switcher.boxes.border.width: 2

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

    snapping.overlay.region.bg.color: #8080b380
    snapping.overlay.edge.bg.color: #8080b380
    snapping.overlay.region.border.width: 1
    snapping.overlay.edge.border.width: 1
    snapping.overlay.region.border.color: #dddda6,#000000,#dddda6
    snapping.overlay.edge.border.color: #dddda6,#000000,#dddda6
  '';
  wayland.windowManager.labwc = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    environment = [
      "XDG_CURRENT_DESKTOP=labwc:wlroots"
      "XKB_DEFAULT_LAYOUT=us"
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
      theme = {
        cornerRadius = 10;
        font = {
          "@name" = "${fonts.sansSerif.name}";
          "@size" = "${builtins.toString fonts.sizes.desktop}";
          "@weight" = "bold";
        };
        icon = "${osConfig.desktopTheme.icons.name}";
        titlebar = {
          # "@showTitle" = true;
          # "@layout" = "icon:iconify,max,close";
          # "@dropShadows" = true;
          # "@dropShadowsOnTiled" = true;
          showTitle = true;
          layout = "icon:iconify,max,close";
          dropShadows = true;
          dropShadowsOnTiled = true;
        };
      };
      keyboard = {
        default = true;
        keybind = [
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
            "@key" = "W-Shift-s";
            action = {
              "@name" = "Execute";
              "@command" = "bash ${../scripts/screenshot}";
            };
          }
          # lock screen
          {
            "@key" = "W-Ctrl-l";
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
            "@key" = "W-b";
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
            "@key" = "W-Shift-b";
            action = {
              "@name" = "Execute";
              "@command" = "${../scripts/waybar.sh}";
            };
          }
          # restart foot server
          {
            "@key" = "W-Shift-b";
            action = {
              "@name" = "Execute";
              "@command" = "${../scripts/restart-foot-server.sh}";
            };
          }
        ];
      };
    };
  };
}
