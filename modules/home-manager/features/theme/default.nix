# depends on system theme module
{osConfig, pkgs, lib, config, ...}:
let
  gtkrcFile = config.lib.stylix.colors {
    template = ./gtkrc.mustache;
    extension = ".css";
  };
in
{
  imports = [./themes];
  config = lib.mkIf osConfig.myOptions.desktopTheme.enable {
    stylix = {
      targets = {
        waybar.enable = false;
        gtk.extraCss = with config.stylix.base16Scheme; ''
          @define-color headerbar_bg_color #${base00};
          @define-color dialog_bg_color #${base00};
          @define-color popover_bg_color #${base00};
          @define-color sidebar_bg_color #${base00};
          @define-color accent_color #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};
          @define-color accent_bg_color #${config.stylix.base16Scheme.${osConfig.desktopTheme.base16Accent}};

           /* No (default) title bar on wayland */
          headerbar.default-decoration {
            /* You may need to tweak these values depending on your GTK theme */
            border-radius: 0;
            border: 0;
            box-shadow: none;
            font-size: 0;
            margin-bottom: 50px;
            margin-top: -100px;
            min-height: 0;
            padding: 0;
          }

          .titlebar,
          .titlebar .background
          {
            border-radius: 0;
          }

          /* rm -rf window shadows */
          window.csd,             /* gtk4? */
          window.csd decoration { /* gtk3 */
            border-radius: 0;
            box-shadow: none;
          }
        '';
      };
    };

    home = {
      /*file = {
        ".config/qt5ct/qt5ct.conf".text = ''
          [Appearance]
          color_scheme_path=/home/gene/.config/qt5ct/colors/test.conf
          custom_palette=false
          icon_theme=${config.gtk.iconTheme.name}
          standard_dialogs=default
          style=kvantum-dark

          [Fonts]
          fixed="${config.stylix.fonts.monospace.name},${toString config.stylix.fonts.sizes.applications},-1,5,5,50,0,0,0,0,Regular"
          general="${config.stylix.fonts.sansSerif.name},${toString config.stylix.fonts.sizes.applications},-1,5,50,0,0,0,0,0,Regular"

          [Interface]
          activate_item_on_single_click=1
          buttonbox_layout=0
          cursor_flash_time=1000
          dialog_buttons_have_icons=1
          double_click_interval=400
          gui_effects=@Invalid()
          keyboard_scheme=2
          menus_have_icons=true
          show_shortcuts_in_context_menus=true
          stylesheets=@Invalid()
          toolbutton_style=4
          underline_shortcut=1
          wheel_scroll_lines=3

          [SettingsWindow]
          geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x2\xb7\0\0\x3\x46\0\0\0\0\0\0\0\0\0\0\x2\xde\0\0\x3\x43\0\0\0\0\x2\0\0\0\x6@\0\0\0\0\0\0\0\0\0\0\x2\xb7\0\0\x3\x46)

          [Troubleshooting]
          force_raster_widgets=1
          ignored_applications=@Invalid()
        '';
      };*/

      sessionVariables = {
        FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"; # make gtk font rendering match qt
        GTK_CSD = 0;
      };

      packages = with pkgs; [
        libsForQt5.qtstyleplugin-kvantum
        #kdePackages.qtstyleplugin-kvantum
        libsForQt5.qt5ct
        #libsForQt5.qtstyleplugins
        #kdePackages.qt6ct
        adw-gtk3
      ];
    };

    /*fonts = {
      fontconfig = {
        enable = true;
        defaultFonts.monospace = [config.stylix.fonts.monospace.name "Terminus (TTF)"];
      };
    };*/

    gtk = {
      enable = true;
      gtk2 = {
        extraConfig = builtins.readFile gtkrcFile;
      };
    };

    qt = {
      enable = true;
      #platformTheme.name = "gtk3";
      style.name = "kvantum-dark";
      #platformTheme.name = "qtct";
      #style.name = "adwaita-dark";
      #style.package = pkgs.adwaita-qt;
    };
  };
}
