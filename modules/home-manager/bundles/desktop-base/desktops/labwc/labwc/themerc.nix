{
  config,
  osConfig,
}: let
  inherit (config.stylix) base16Scheme;
  inherit (osConfig.desktopTheme) base16Accent;
in {
  home.file.".themes/my-labwc/labwc".source = ./icons;
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
    window.titlebar.padding.height: 10

    # window border
    window.active.border.color: #${base16Scheme.base01}
    window.inactive.border.color: #${base16Scheme.base01}

    # ToggleKeybinds status indicator
    window.active.indicator.toggled-keybind.color: #${base16Scheme.base08}

    # window titlebar background
    window.active.title.bg.color: #${base16Scheme.base0D}
    window.inactive.title.bg.color: #${base16Scheme.base0D}
    #window.*.title.bg: Solid
    window.*.title.bg.colorTo: #${base16Scheme.base00}
    window.*.title.bg: Gradient Vertical

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
    window.button.hover.bg.color: #00000000

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
    window.active.shadow.size: 10
    window.inactive.shadow.size: 10
    window.active.shadow.color: #00000040
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
    menu.separator.padding.height: 0
    menu.separator.color: #${base16Scheme.base01}
    menu.title.bg.color: #${base16Scheme.base01}
    menu.title.text.color: #${base16Scheme.base05}
    menu.title.text.justify: Center

    # on screen display (window-cycle dialog)
    osd.bg.color: #${base16Scheme.base00}
    osd.border.color: #${base16Scheme.base01}
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
    osd.window-switcher.style-thumbnail.padding: 5
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

    snapping.overlay.region.bg.color: #${base16Scheme.${base16Accent}}80
    snapping.overlay.edge.bg.color: #${base16Scheme.${base16Accent}}80
    snapping.overlay.region.border.width: 1
    snapping.overlay.edge.border.width: 1
    snapping.overlay.region.border.color: #${base16Scheme.${base16Accent}}
    snapping.overlay.edge.border.color: #${base16Scheme.${base16Accent}}
  '';
}
